/** CIL MethodSpec node. */
class SgAsmCilMethodSpec: public SgAsmCilMetadata {
    /** Property: Method.
     *
     *  An index into the MethodDef or MemberRef table. */
    [[using Rosebud: rosetta]]
    uint32_t Method;

    /** Property: Instantiation.
     *
     *  An index into the Blob heap. */
    [[using Rosebud: rosetta]]
    uint32_t Instantiation;

public:
    void parse(std::vector<uint8_t>& buf, size_t& index, uint64_t uses4byteIndexing);

    const SgAsmCilMetadata* get_Method_object() const;
    const std::uint8_t* get_Instantiation_blob() const;
};
