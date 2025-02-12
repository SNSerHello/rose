/** JVM Signature attribute.
 *
 *  A Signature attribute stores a signature for a class, interface, constructor, method, field, or record component, see section
 *  4.7.9 of the JVM specification. */
class SgAsmJvmSignature: public SgAsmJvmAttribute {
    /** Property: signature_index
     *
     *  The value of the signature_index item must be a valid index into the constant_pool table (see JVM specification). */
    [[using Rosebud: rosetta]]
    uint16_t signature_index = 0;

public:
    /** Initialize the attribute by parsing the file. */
    virtual SgAsmJvmAttribute* parse(SgAsmJvmConstantPool* pool) override;

    /** Print some debugging information */
    virtual void dump(FILE*, const char *prefix, ssize_t idx) const override;
};
