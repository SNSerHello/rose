/** Base class for scalar types. */
[[Rosebud::abstract]]
class SgAsmScalarType: public SgAsmType {
    [[using Rosebud: rosetta, accessors(), mutators()]]
    ByteOrder::Endianness minorOrder = ByteOrder::ORDER_UNSPECIFIED;

    /** Property: Major byte order for mixed-order types. */
    [[using Rosebud: rosetta, accessors(), mutators()]]
    ByteOrder::Endianness majorOrder = ByteOrder::ORDER_UNSPECIFIED;

    /** Property: Stride of major byte order for mixed order types. */
    [[using Rosebud: rosetta, accessors(), mutators()]]
    size_t majorNBytes = 0;

    /** Property: Number of bits. */
    [[using Rosebud: rosetta, accessors(), mutators()]]
    size_t nBits = 0;

protected:
    /** Construct a new scalar type.
     *
     *  Since scalar types are base classes, one normally does not construct just a scalar type but rather one of the base
     *  classes. */
    SgAsmScalarType(ByteOrder::Endianness, size_t nBits);

public:
    /** Property: Number of bits. */
    virtual size_t get_nBits() const override;

    /** Property: Minor byte order. This is the usual notion of byte order. */
    ByteOrder::Endianness get_minorOrder() const;

    /** Property: Major byte order for mixed-order types. */
    ByteOrder::Endianness get_majorOrder() const;

    /** Property: Stride of major byte order for mixed order types. */
    size_t get_majorNBytes() const;

    // Overrides documented in base class
    virtual void check() const override;
    virtual std::string toString() const override;
};
