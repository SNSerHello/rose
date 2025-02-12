/** CIL StandAloneSig node. */
class SgAsmCilStandAloneSig: public SgAsmCilMetadata {
    /** Property: Signature.
     *
     *  An index into the Blob heap. */
    [[using Rosebud: rosetta]]
    uint32_t Signature;

public:
    void parse(std::vector<uint8_t>& buf, size_t& index, uint64_t uses4byteIndexing);

    const std::uint8_t* get_Signature_blob() const;
};
