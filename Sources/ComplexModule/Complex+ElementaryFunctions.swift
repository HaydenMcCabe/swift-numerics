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
        let a = Complex(RealType.cos(x.imaginary), RealType.sin(x.imaginary))
        return a.multiplied(by: RealType.exp(x.real))
    }

    // Todo: replace
    public static func expMinusOne(_ x: Self) -> Self {
        Complex.exp(x - 1)
    }

    @_transparent
    public static func pow(_ x: Self, _ y: Self) -> Self {
        Complex.exp(y * Complex.log(x))
    }

    @_transparent
    public static func pow(_ x: Self, _ n: Int) -> Self {
        Complex.exp(Complex.log(x).multiplied(by: RealType(n)))
    }

    @_transparent
    public static func sqrt(_ x: Self) -> Self {
        Complex.exp(Complex.log(x).divided(by: RealType(2)))
    }

    @_transparent
    public static func root(_ x: Self, _ n: Int) -> Self {
        Complex.exp(Complex.log(x).divided(by: RealType(n)))
    }

    @_transparent
    public static func log(_ x: Self) -> Self {
        Complex(RealType.log(x.length), x.phase)
    }

    // Todo : replace
    public static func log(onePlus x: Self) -> Self {
        Complex.log(x + 1)
    }

    @_transparent
    public static func cos(_ x: Self) -> Self {
        Complex.cosh(Complex(-x.imaginary, x.real))
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
        return a == -Complex.i ? -a : a
    }

    @_transparent
    public static func cosh(_ x: Self) -> Self {
        Complex( 
            RealType.cosh(x.real) * RealType.cos(x.imaginary),
            RealType.sinh(x.real) * RealType.sin(x.imaginary)
        )
    }

    @_transparent
    public static func sinh(_ x: Self) -> Self {
        Complex(
            RealType.sinh(x.real) * RealType.cos(x.imaginary),
            RealType.cosh(x.real) * RealType.sin(x.imaginary)
        )
    }
/*
public func tanh<T>(z: Complex<T>) -> Complex<T> {
    let ez = exp(z), e_z = exp(-z)
    return (ez - e_z) / (ez + e_z)
}
*/
    @_transparent
    public static func tanh(_ x: Self) -> Self {
        let a = Complex.sinh(x) / Complex.cosh(x)
        return a.isZero ? Complex.one : a
    }

    @_transparent
    public static func acos(_ x: Self) -> Self {
        let a = sqrt((x * x) - Complex.one)
        let b = -Complex.i * Complex.log(x + a)
        return (x.real.sign != x.imaginary.sign) ? b * -Complex.one : b
    }

    @_transparent
    public static func asin(_ x: Self) -> Self {
        let a = Complex.sqrt(Complex.one - x * x)
        return -Complex.i * Complex.log(Complex.i * x + a)
    }

    @_transparent
    public static func atan(_ x: Self) -> Self {
        let a = (Complex.i - x) / (Complex.i + x)
        return -Complex.log(a) * Complex.i.divided(by: 2)
    }

   @_transparent
    public static func acosh(_ x: Self) -> Self {
        let a = Complex.i.multiplied(by: 
            RealType(signOf: x.imaginary, magnitudeOf: 1))
        return a * Complex.acos(x)
    }
    
    @_transparent
    public static func asinh(_ x: Self) -> Self {
        -Complex.i * Complex.asin(Complex.i * x)
    }

    @_transparent
    public static func atanh(_ x: Self) -> Self {
        -Complex.i * Complex.atan(Complex.i * x)
 
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
