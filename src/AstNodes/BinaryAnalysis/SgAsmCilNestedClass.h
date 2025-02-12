/** CIL NestedClass node. */
class SgAsmCilNestedClass: public SgAsmCilMetadata {
    /** Property: NestedClass.
     *
     *  An index into the TypeDef table. */
    [[using Rosebud: rosetta]]
    uint32_t NestedClass;

    /** Property: EnclosingClass.
     *
     *  An index into the TypeDef table. */
    [[using Rosebud: rosetta]]
    uint32_t EnclosingClass;

public:
    void parse(std::vector<uint8_t>& buf, size_t& index, uint64_t uses4byteIndexing);

    const SgAsmCilMetadata* get_NestedClass_object() const;
    const SgAsmCilMetadata* get_EnclosingClass_object() const;
};
