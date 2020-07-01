//===--- Double+ComplexFunctionReal.swift ---------------------*- swift -*-===//
//
// This source file is part of the Swift Numerics open source project
//
// Copyright (c) 2019 - 2020 Apple Inc. and the Swift Numerics project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

import _NumericsShims
import RealModule

#if !os(Windows)
extension Double: ComplexFunctionReal {
  @_transparent
  public static func exp(_ x: Complex<Double>) -> Complex<Double> {
    let a = CComplexDouble(real: x.real, imag: x.imaginary)
    let b = libm_cexp(a)
    return Complex<Double>(b.real, b.imag)
  } 

  // TODO: Replace with accurate implementation
  @_transparent
  public static func expMinusOne(_ x: Complex<Double>) -> Complex<Double> {
    exp(x) - 1
  }

  @_transparent
  public static func cosh(_ x: Complex<Double>) -> Complex<Double> {
    let a = CComplexDouble(real: x.real, imag: x.imaginary)
    let b = libm_ccosh(a)
    return Complex<Double>(b.real, b.imag)
  }

  @_transparent
  public static func sinh(_ x: Complex<Double>) -> Complex<Double> {
    let a = CComplexDouble(real: x.real, imag: x.imaginary)
    let b = libm_csinh(a)
    return Complex<Double>(b.real, b.imag)
  }

  @_transparent
  public static func tanh(_ x: Complex<Double>) -> Complex<Double> {
    let a = CComplexDouble(real: x.real, imag: x.imaginary)
    let b = libm_ctanh(a)
    return Complex<Double>(b.real, b.imag)
  }

  @_transparent
  public static func cos(_ x: Complex<Double>) -> Complex<Double> {
    let a = CComplexDouble(real: x.real, imag: x.imaginary)
    let b = libm_ccos(a)
    return Complex<Double>(b.real, b.imag)
  }

  @_transparent
  public static func sin(_ x: Complex<Double>) -> Complex<Double> {
    let a = CComplexDouble(real: x.real, imag: x.imaginary)
    let b = libm_csin(a)
    return Complex<Double>(b.real, b.imag)
  }

  @_transparent
  public static func tan(_ x: Complex<Double>) -> Complex<Double> {
    let a = CComplexDouble(real: x.real, imag: x.imaginary)
    let b = libm_ctan(a)
    return Complex<Double>(b.real, b.imag)
  }

  @_transparent
  public static func log(_ x: Complex<Double>) -> Complex<Double> {
    let a = CComplexDouble(real: x.real, imag: x.imaginary)
    let b = libm_clog(a)
    return Complex<Double>(b.real, b.imag)
  }

  // TODO: Replace with accurate implementation
  @_transparent
  public static func log(onePlus x: Complex<Double>) -> Complex<Double> {
    log(1 + x)
  }

  @_transparent
  public static func acosh(_ x: Complex<Double>) -> Complex<Double> {
    let a = CComplexDouble(real: x.real, imag: x.imaginary)
    let b = libm_cacosh(a)
    return Complex<Double>(b.real, b.imag)
  }

  @_transparent
  public static func asinh(_ x: Complex<Double>) -> Complex<Double> {
    let a = CComplexDouble(real: x.real, imag: x.imaginary)
    let b = libm_casinh(a)
    return Complex<Double>(b.real, b.imag)
  }

  @_transparent
  public static func atanh(_ x: Complex<Double>) -> Complex<Double> {
    let a = CComplexDouble(real: x.real, imag: x.imaginary)
    let b = libm_catanh(a)
    return Complex<Double>(b.real, b.imag)
  }

  @_transparent
  public static func acos(_ x: Complex<Double>) -> Complex<Double> {
    let a = CComplexDouble(real: x.real, imag: x.imaginary)
    let b = libm_cacos(a)
    return Complex<Double>(b.real, b.imag)
  }

  @_transparent
  public static func asin(_ x: Complex<Double>) -> Complex<Double> {
    let a = CComplexDouble(real: x.real, imag: x.imaginary)
    let b = libm_casin(a)
    return Complex<Double>(b.real, b.imag)
  }

  @_transparent
  public static func atan(_ x: Complex<Double>) -> Complex<Double> {
    let a = CComplexDouble(real: x.real, imag: x.imaginary)
    let b = libm_catan(a)
    return Complex<Double>(b.real, b.imag)
  }

  // TODO: Check for errors as in Double+Real
  @_transparent
  public static func pow(_ x: Complex<Double>, _ y: Complex<Double>) -> Complex<Double> {
    let a = CComplexDouble(real: x.real, imag: x.imaginary)
    let b = CComplexDouble(real: y.real, imag: y.imaginary)
    let c = libm_cpow(a, b)
    return Complex<Double>(c.real, c.imag)
  }

  // TODO: Check for errors as in Double+Real
  @_transparent
  public static func pow(_ x: Complex<Double>, _ n: Int) -> Complex<Double> {
    let a = CComplexDouble(real: x.real, imag: x.imaginary)
    let nComplex = CComplexDouble(real: Double(n), imag: 0)
    let b = libm_cpow(a, nComplex)
    return Complex<Double>(b.real, b.imag)
  }

  // TODO: Check for errors as in Double+Real
  @_transparent
  public static func sqrt(_ x: Complex<Double>) -> Complex<Double> {
    let a = CComplexDouble(real: x.real, imag: x.imaginary)
    let b = libm_csqrt(a)
    return Complex<Double>(b.real, b.imag)
  }

  @_transparent
  public static func root(_ x: Complex<Double>, _ n: Int) -> Complex<Double> {
    let a = CComplexDouble(real: x.real, imag: x.imaginary)
    let nComplex = CComplexDouble(real: 1 / Double(n), imag: 0)
    let b = libm_cpow(a, nComplex)
    return Complex<Double>(b.real, b.imag)
  }
}
#endif
