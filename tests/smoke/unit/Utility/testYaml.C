#include <Rose/Yaml.h>
#include <Sawyer/Assert.h>

static void
testSequence() {
    auto root = Rose::Yaml::parse("- a\n"
                                  "- b\n"
                                  "- c\n");

    ASSERT_always_require(root.size() == 3);
    Rose::Yaml::Iterator i1 = root.begin();

    ASSERT_always_require((*i1).second.isScalar());
    ASSERT_always_require((*i1).second.as<std::string>() == "a");

    // Post-increment
    ASSERT_always_require((*i1++).second.as<std::string>() == "a");
    ASSERT_always_require((*i1).second.as<std::string>() == "b");

    // Pre-increment
    ASSERT_always_require((*++i1).second.as<std::string>() == "c");
    ASSERT_always_require((*i1).second.as<std::string>() == "c");

    // Pre-decrement
    ASSERT_always_require((*--i1).second.as<std::string>() == "b");
    ASSERT_always_require((*i1).second.as<std::string>() == "b");

    // Post-decrement
    ASSERT_always_require((*i1--).second.as<std::string>() == "b");
    ASSERT_always_require((*i1).second.as<std::string>() == "a");

    // Arrow operator
    ASSERT_always_require(i1->second.as<std::string>() == "a");
}

static void
testConversion() {
    auto root = Rose::Yaml::parse(
                      "a: 123\n"
                      "b: 0123\n"                       // 123 (octal is not supported)
                      "c: 0x123\n"                      // 291
                      "d: \" 123\"\n"                   // not an integral type
                      "e: \"123 \"\n"                   // not an integral type
                      "f: -1\n");                       // negative value


    ASSERT_always_require(root.size() == 6);
    ASSERT_always_require(root.isMap());

    // valid conversions
    ASSERT_always_require(root["a"].as<unsigned>() == 123);
    ASSERT_always_require(root["b"].as<unsigned>() == 123);
    ASSERT_always_require(root["c"].as<unsigned>() == 291);

    // invalid conversions due to syntax
    ASSERT_always_require(root["d"].as<std::string>() == " 123");
    try {
        root["d"].as<unsigned>();
        ASSERT_not_reachable("should not have converted to unsigned due to leading space");
    } catch (...) {
    }
    ASSERT_always_require(root["e"].as<std::string>() == "123 ");
    try {
        root["e"].as<unsigned>();
        ASSERT_not_reachable("should not have converted to unsigned due to trailing space");
    } catch (...) {
    }

    // invalid conversion due to overflow
    try {
        root["c"].as<uint8_t>();
        ASSERT_not_reachable("291 is wider than 8 bits");
    } catch (...) {
    }
    try {
        root["f"].as<unsigned>();
        ASSERT_not_reachable("-1 is not in domain of 'unsigned'");
    } catch (...) {
    }
}

static void
testBoolean() {
    Rose::Yaml::Node n1;

    auto n2 = Rose::Yaml::parse(
                      "a: foo\n"
                      "b:\n"
                      "  - one\n"
                      "  - two\n");

    if (n1) {
        ASSERT_always_require(!n1);
        ASSERT_not_reachable("prior assert should have failed");
    }
}

static void
testConst() {
    auto root_rw = Rose::Yaml::parse(
                      "a: foo\n"
                      "b:\n"
                      "  - zero\n"
                      "  - one\n");
    const Rose::Yaml::Node &root = root_rw;

    ASSERT_always_require(root["a"].as<std::string>() == "foo");
    ASSERT_always_require(root["c"].isNone());
    ASSERT_always_require(root["c"].isNone());          // not created

    const auto &b = root["b"];
    ASSERT_always_require(Rose::Yaml::Node::SequenceType == b.type());
    ASSERT_always_require(b[0].as<std::string>() == "zero");
    ASSERT_always_require(b[2].isNone());
    ASSERT_always_require(b[2].isNone());
}

static void
testIterator() {
    auto root_rw = Rose::Yaml::parse(
                      "- a\n"
                      "- b\n"
                      "- c\n");
    Rose::Yaml::Iterator iter = root_rw.begin();
    ASSERT_always_require(iter == root_rw.begin());
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wself-assign-overloaded"
#endif
    iter = iter;                                        // intentional self-assignment
    ASSERT_always_require(iter == root_rw.begin());
#ifdef __clang__
#pragma clang diagnostic pop
#endif
}

int
main() {
    testSequence();
    testConversion();
    testBoolean();
    testConst();
    testIterator();
}
