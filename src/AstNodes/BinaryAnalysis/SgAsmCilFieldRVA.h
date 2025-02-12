/** CIL FieldRVA node. */
class SgAsmCilFieldRVA: public SgAsmCilMetadata {
    /** Property: RVA.
     *
     *  A 4-byte constant. */
    [[using Rosebud: rosetta]]
    uint32_t RVA;

    /** Property: Field.
     *
     *  An index into Field table. */
    [[using Rosebud: rosetta]]
    uint32_t Field;

public:
    void parse(std::vector<uint8_t>& buf, size_t& index, uint64_t uses4byteIndexing);

    const SgAsmCilMetadata* get_Field_object() const;
};
