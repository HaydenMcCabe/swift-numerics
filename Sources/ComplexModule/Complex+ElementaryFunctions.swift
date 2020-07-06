//===--- Complex+ElementaryFunctions.swift --------------------*- swift -*-===//
//
// This source file is part of the Swift Numerics open source project
//
// Copyright (c) 2019 - 2020 Apple Inc. and the Swift Numerics project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

import RealModule

/// Conditional conformance for ElementaryFunctions where the generic RealType
/// conforms to ComplexFunctionReal.
#if !os(Windows)
extension Complex: ElementaryFunctions {
    public static func exp(_ x: Self) -> Self {
        let a = Complex(.cos(x.imaginary), .sin(x.imaginary))
        return a.multiplied(by: .exp(x.real))
    }

    // Todo: replace
    public static func expMinusOne(_ x: Self) -> Self {
        .exp(x - .one)
    }

    @_transparent
    public static func pow(_ x: Self, _ y: Self) -> Self {
        .exp(y * .log(x))
    }

    @_transparent
    public static func pow(_ x: Self, _ n: Int) -> Self {
        .exp(Complex.log(x).multiplied(by: RealType(n)))
    }

    @_transparent
    public static func sqrt(_ x: Self) -> Self {
        Complex(RealType.cos(x.phase/2), .sin(x.phase/2)).multiplied(by: .sqrt(x.length))
    }

    @_transparent
    public static func root(_ x: Self, _ n: Int) -> Self {
        .exp(Complex.log(x).divided(by: RealType(n)))
    }

    @_transparent
    public static func log(_ x: Self) -> Self {
        Complex(RealType.log(x.length), x.phase)
    }

    /// This function uses a Taylor series to find an approximation
    /// of ln(1 + x) for very small x, i.e., for values close to zero.
    public static func log(onePlus x: Self) -> Self {
        let maxIterations = 40
        var n = 0
        var approx = x
        var prior = x
        var z = x
        let zz = x * x
        var f = 1
        repeat {
            n += 1
            prior = approx
            z *= zz
            f *= (2*n) * (2*n + 1)
            let term = z.multiplied(by: 1 / RealType(f))
            approx += (n % 2 == 0) ? term : -term
        } while approx != prior && n < maxIterations
        print(n)
        return approx
    }

    @_transparent
    public static func cos(_ x: Self) -> Self {
        .cosh(Complex(-x.imaginary, x.real))
    }

    @_transparent
    public static func sin(_ x: Self) -> Self {
        let sinh = Complex.sinh(Complex(-x.imaginary, x.real))
        return Complex(sinh.imaginary, -sinh.real)
    }

    @_transparent
    public static func tan(_ x: Self) -> Self {
        let tanh = Complex.tanh(Complex(-x.imaginary, x.real))
        let a = Complex(tanh.imaginary, -tanh.real)
        return a == -.i ? -a : a
    }

    @_transparent
    public static func cosh(_ x: Self) -> Self {
        Complex( 
            .cosh(x.real) * .cos(x.imaginary),
            .sinh(x.real) * .sin(x.imaginary)
        )
    }

    @_transparent
    public static func sinh(_ x: Self) -> Self {
        Complex(
            .sinh(x.real) * .cos(x.imaginary),
            .cosh(x.real) * .sin(x.imaginary)
        )
    }

    @_transparent
    public static func tanh(_ x: Self) -> Self {
        let a = .sinh(x) / .cosh(x)
        return a.isZero ? .one : a
    }

    @_transparent
    public static func acos(_ x: Self) -> Self {
        let a = sqrt((x * x) - .one)
        let b = -.i * .log(x + a)
        return (x.real.sign != x.imaginary.sign) ? b * -.one : b
    }

    @_transparent
    public static func asin(_ x: Self) -> Self {
        // For values close to 0, use
        // a Taylor series approximation
        if x.length <= RealType(1)/2 {
            let maxIterations = 40
            // Initialize variables
            // to their state after adding the
            // 0th term of the series
            var approx = x
            var n = 0
            var k: RealType = 1
            var z = x
            let zz = x*x
            var prior = approx
            repeat {
                prior = approx
                n += 1
                let a = 2 * n - 1
                k *= RealType(a) / RealType(a+1)
                z *= zz
                approx += z.multiplied(by: k / RealType(a + 2))
            } while prior != approx && n < maxIterations
            return approx
        } else {
            let a = Complex(RealType.pi/2) - .acos(x)
            return a.isZero ? x : a
        }
    }

    @_transparent
    public static func atan(_ x: Self) -> Self {
        //if x.length < RealType(1)/2 {
        if true {
            let maxIterations = 40
            var approx = x
            var prior = x
            var n = 0
            var z = x
            let zz = x * x
            repeat {
                n += 1
                prior = approx
                z *= zz
                let term = z.divided(by: RealType(2 * n + 1))
                approx += (n % 2 == 0) ? term : -term
            } while prior != approx && n < maxIterations
            return approx
        } else {
            let a = (.i - x) / (.i + x)
            return -.log(a) * Complex.i.divided(by: 2)
        }
    }

   @_transparent
    public static func acosh(_ x: Self) -> Self {
        let a = Complex.i.multiplied(by: 
            RealType(signOf: x.imaginary, magnitudeOf: 1))
        return a * .acos(x)
    }
    
    @_transparent
    public static func asinh(_ x: Self) -> Self {
        -.i * .asin(.i * x)
    }

    @_transparent
    public static func atanh(_ x: Self) -> Self {
        return -.i * .atan(.i * x)
        let maxIterations = 40
        var approx = x
        var prior = x
        var n = 0
        var z = x
        let zz = x * x
        repeat {
            n += 1
            prior = approx
            z *= zz
            let term = z.divided(by: RealType(2 * n + 1))
            approx += term
        } while prior != approx && n < maxIterations
        return approx
    }
}

extension Complex where RealType: ComplexFunctionReal {
    @_transparent
    public static func exp_builtin(_ x: Self) -> Self {
        RealType.exp(x)
    }

    @_transparent
    public static func cosh_builtin(_ x: Self) -> Self {
        RealType.cosh(x)
    }

    @_transparent
    public static func sinh_builtin(_ x: Self) -> Self {
        RealType.sinh(x)
    }

    @_transparent
    public static func tanh_builtin(_ x: Self) -> Self {
        RealType.tanh(x)
    }

    @_transparent
    public static func cos_builtin(_ x: Self) -> Self {
        RealType.cos(x)
    }

    @_transparent
    public static func sin_builtin(_ x: Self) -> Self {
        RealType.sin(x)
    }

    @_transparent
    public static func tan_builtin(_ x: Self) -> Self {
        RealType.tan(x)
    }

    @_transparent
    public static func log_builtin(_ x: Self) -> Self {
        RealType.log(x)
    }

    @_transparent
    public static func acosh_builtin(_ x: Self) -> Self {
        RealType.acosh(x)
    }

    @_transparent
    public static func asinh_builtin(_ x: Self) -> Self {
        RealType.asinh(x)
    }

    @_transparent
    public static func atanh_builtin(_ x: Self) -> Self {
        RealType.atanh(x)
    }

    @_transparent
    public static func acos_builtin(_ x: Self) -> Self {
        RealType.acos(x)
    }

    @_transparent
    public static func asin_builtin(_ x: Self) -> Self {
        RealType.asin(x)
    }

    @_transparent
    public static func atan_builtin(_ x: Self) -> Self {
        RealType.atan(x)
    }

    @_transparent
    public static func pow_builtin(_ x: Self, _ y: Self) -> Self {
        RealType.pow(x, y)
    }

    @_transparent
    public static func sqrt_builtin(_ x: Self) -> Self {
        RealType.sqrt(x)
    }
}
#endif
