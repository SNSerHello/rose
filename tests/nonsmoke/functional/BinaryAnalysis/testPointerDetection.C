// Example of using Rose::BinaryAnalysis::PointerDetection to find pointer variables in a binary specimen.
#include "conditionalDisable.h"
#ifdef ROSE_BINARY_TEST_DISABLED
#include <iostream>
int main() { std::cout <<"disabled for " <<ROSE_BINARY_TEST_DISABLED <<"\n"; return 1; }
#else

#include <rose.h>
#include <Rose/BinaryAnalysis/PointerDetection.h>

#include <Rose/BinaryAnalysis/Disassembler/Base.h>
#include <Rose/BinaryAnalysis/Partitioner2/BasicBlock.h>
#include <Rose/BinaryAnalysis/Partitioner2/EngineBinary.h>
#include <Rose/BinaryAnalysis/Partitioner2/Partitioner.h>
#include <Rose/BinaryAnalysis/SymbolicExpression.h>

#include <rose_strtoull.h>

#include <Sawyer/CommandLine.h>
#include <boost/foreach.hpp>
#include <string>
#include <vector>

using namespace Rose::Diagnostics;
using namespace Rose::BinaryAnalysis;
namespace P2 = Rose::BinaryAnalysis::Partitioner2;

struct Settings {
    std::vector<std::string> functionNames;
};

static std::vector<std::string>
parseCommandLine(int argc, char *argv[], Partitioner2::Engine &engine, Settings &settings) {
    using namespace Sawyer::CommandLine;

    std::string purpose = "finds memory variables that are used as pointers";
    std::string description =
        "This tool disassembles the binary specimen and examines each function to find memory locations that are "
        "used as pointers, and whether they're pointers to code or data. It's primary purpose is to test the "
        "Rose::BinaryAnalysis::PointerDetection analysis.";

    SwitchGroup tool("Tool-specific switches");
    tool.insert(Switch("function")
                .argument("name_or_address", anyParser(settings.functionNames))
                .whichValue(SAVE_ALL)
                .doc("Names or addresses of functions that should be analyzed. This switch may appear more than once if "
                     "more than one function should be analyzed. Results will be presented in this same order. "
                     "If no names or addresses are specified then all functions are analyzed."));

    return engine.commandLineParser(purpose, description).with(tool).parse(argc, argv).apply().unreachedArgs();
}

static bool
shouldAnalyze(const Settings &settings, const P2::Function::Ptr &function) {
    if (settings.functionNames.empty())
        return true;
    BOOST_FOREACH (const std::string &name_or_address, settings.functionNames) {
        if (function->name() == name_or_address)
            return true;
        char *rest = nullptr;
        errno = 0;
        rose_addr_t va = rose_strtoull(name_or_address.c_str(), &rest, 0);
        if (0 == errno && !*rest && va == function->address())
            return true;
    }
    return false;
}

int
main(int argc, char *argv[]) {
    ROSE_INITIALIZE;
    SymbolicExpression::serializeVariableIds = true;
    Settings settings;
    P2::Engine::Ptr engine = P2::EngineBinary::instance();
    std::vector<std::string> specimen = parseCommandLine(argc, argv, *engine, settings);
    if (specimen.empty()) {
        mlog[FATAL] <<"no binary specimen specified; see --help\n";
        exit(1);
    }
    P2::Partitioner::Ptr partitioner = engine->partition(specimen);

    for (const P2::Function::Ptr &function : partitioner->functions()) {
        if (shouldAnalyze(settings, function)) {
            std::cout <<"\nPointer detection analysis for " <<function->printableName() <<"\n";

            // Display the function's instructions for easy reference
            std::cout <<"  Instructions:\n";
            for (rose_addr_t bbVa : function->basicBlockAddresses()) {
                if (P2::BasicBlock::Ptr bb = partitioner->basicBlockExists(bbVa)) {
                    for (SgAsmInstruction *insn : bb->instructions()) {
                        std::cout <<"    " <<partitioner->unparse(insn) <<"\n";
                    }
                }
            }

            //! [documentation guts]
            // Run the analysis
            PointerDetection::Analysis pda(engine->disassembler());
            pda.analyzeFunction(partitioner, function);

            // Show the results
            if (!pda.hasResults()) {
                std::cout <<"  Analysis failed (perhaps not a well-formed function?)\n";
            } else {
                if (!pda.didConverge())
                    std::cout <<"  WARNING: Analysis did not converge; following info may be incomplete\n";
                std::cout <<"  Code pointers:\n";
                for (const PointerDetection::PointerDescriptor &desc : pda.codePointers())
                    std::cout <<"    " <<desc.nBits <<"-bit pointer at " <<*desc.pointerVa <<"\n";
                std::cout <<"  Data pointers:\n";
                for (const PointerDetection::PointerDescriptor &desc : pda.dataPointers())
                    std::cout <<"    " <<desc.nBits <<"-bit pointer at " <<*desc.pointerVa <<"\n";
            }
            //! [documentation guts]
        }
    }
}

#endif
