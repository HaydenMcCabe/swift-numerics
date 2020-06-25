import RealModule

/// Conditional conformance for ElementaryFunctions where the generic RealType
/// conforms to ComplexFunctionReal.
#if !os(Windows)
extension Complex: ElementaryFunctions where RealType: ComplexFunctionReal {
    public static func exp(_ x: Complex<RealType>) -> Complex<RealType> {
        RealType.exp(x)
    }

    public static func expMinusOne(_ x: Complex<RealType>) -> Complex<RealType> {
        RealType.expMinusOne(x)
    }

    public static func cosh(_ x: Complex<RealType>) -> Complex<RealType> {
        RealType.cosh(x)
    }

    public static func sinh(_ x: Complex<RealType>) -> Complex<RealType> {
        RealType.sinh(x)
    }

    public static func tanh(_ x: Complex<RealType>) -> Complex<RealType> {
        RealType.tanh(x)
    }

    public static func cos(_ x: Complex<RealType>) -> Complex<RealType> {
        RealType.cos(x)
    }

    public static func sin(_ x: Complex<RealType>) -> Complex<RealType> {
        RealType.sin(x)
    }

    public static func tan(_ x: Complex<RealType>) -> Complex<RealType> {
        RealType.tan(x)
    }

    public static func log(_ x: Complex<RealType>) -> Complex<RealType> {
        RealType.log(x)
    }

    public static func log(onePlus x: Complex<RealType>) -> Complex<RealType> {
        RealType.log(onePlus: x)
    }

    public static func acosh(_ x: Complex<RealType>) -> Complex<RealType> {
        RealType.acosh(x)
    }

    public static func asinh(_ x: Complex<RealType>) -> Complex<RealType> {
        RealType.asinh(x)
    }

    public static func atanh(_ x: Complex<RealType>) -> Complex<RealType> {
        RealType.atanh(x)
    }

    public static func acos(_ x: Complex<RealType>) -> Complex<RealType> {
        RealType.acos(x)
    }

    public static func asin(_ x: Complex<RealType>) -> Complex<RealType> {
        RealType.asin(x)
    }

    public static func atan(_ x: Complex<RealType>) -> Complex<RealType> {
        RealType.atan(x)
    }

    public static func pow(_ x: Complex<RealType>, _ y: Complex<RealType>) -> Complex<RealType> {
        RealType.pow(x, y)
    }

    public static func pow(_ x: Complex<RealType>, _ n: Int) -> Complex<RealType> {
        RealType.pow(x, n)
    }

    public static func sqrt(_ x: Complex<RealType>) -> Complex<RealType> {
        RealType.sqrt(x)
    }

    public static func root(_ x: Complex<RealType>, _ n: Int) -> Complex<RealType> {
        RealType.root(x, n)
    }
}
#endif
