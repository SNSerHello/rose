/** JVM ModuleMainClass attribute.
 *
 *  A ModuleMainClass attribute stores a signature for a class, interface, constructor, method, field, or record component, see
 *  section 4.7.27 of the JVM specification. */
class SgAsmJvmModuleMainClass: public SgAsmJvmAttribute {
    /** Property: main_class_index
     *
     *  The value of the main_class_index item must be a valid index into the constant_pool table (see JVM specification). */
    [[using Rosebud: rosetta]]
    uint16_t main_class_index = 0;

public:
    /** Initialize the attribute by parsing the file. */
    virtual SgAsmJvmAttribute* parse(SgAsmJvmConstantPool* pool) override;

    /** Print some debugging information */
    virtual void dump(FILE*, const char *prefix, ssize_t idx) const override;
};
