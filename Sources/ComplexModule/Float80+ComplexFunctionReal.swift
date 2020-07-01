//===--- Float80+ComplexFunctionReal.swift --------------------*- swift -*-===//
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

// Restrict extension to platforms for which Float80 exists.
#if (arch(i386) || arch(x86_64)) && !os(Windows) && !os(Android)
extension Float80: ComplexFunctionReal {
  @_transparent
  public static func exp(_ x: Complex<Float80>) -> Complex<Float80> {
    let a = CComplexFloat80(real: x.real, imag: x.imaginary)
    let b = libm_cexpl(a)
    return Complex<Float80>(b.real, b.imag)
  } 

  // TODO: Replace with accurate implementation
  @_transparent
  public static func expMinusOne(_ x: Complex<Float80>) -> Complex<Float80> {
    exp(x) - 1
  }

  @_transparent
  public static func cosh(_ x: Complex<Float80>) -> Complex<Float80> {
    let a = CComplexFloat80(real: x.real, imag: x.imaginary)
    let b = libm_ccoshl(a)
    return Complex<Float80>(b.real, b.imag)
  }

  @_transparent
  public static func sinh(_ x: Complex<Float80>) -> Complex<Float80> {
    let a = CComplexFloat80(real: x.real, imag: x.imaginary)
    let b = libm_csinhl(a)
    return Complex<Float80>(b.real, b.imag)
  }

  @_transparent
  public static func tanh(_ x: Complex<Float80>) -> Complex<Float80> {
    let a = CComplexFloat80(real: x.real, imag: x.imaginary)
    let b = libm_ctanhl(a)
    return Complex<Float80>(b.real, b.imag)
  }

  @_transparent
  public static func cos(_ x: Complex<Float80>) -> Complex<Float80> {
    let a = CComplexFloat80(real: x.real, imag: x.imaginary)
    let b = libm_ccosl(a)
    return Complex<Float80>(b.real, b.imag)
  }

  @_transparent
  public static func sin(_ x: Complex<Float80>) -> Complex<Float80> {
    let a = CComplexFloat80(real: x.real, imag: x.imaginary)
    let b = libm_csinl(a)
    return Complex<Float80>(b.real, b.imag)
  }

  @_transparent
  public static func tan(_ x: Complex<Float80>) -> Complex<Float80> {
    let a = CComplexFloat80(real: x.real, imag: x.imaginary)
    let b = libm_ctanl(a)
    return Complex<Float80>(b.real, b.imag)
  }

  @_transparent
  public static func log(_ x: Complex<Float80>) -> Complex<Float80> {
    let a = CComplexFloat80(real: x.real, imag: x.imaginary)
    let b = libm_clogl(a)
    return Complex<Float80>(b.real, b.imag)
  }

  // TODO: Replace with accurate implementation
  @_transparent
  public static func log(onePlus x: Complex<Float80>) -> Complex<Float80> {
    log(1 + x)
  }

  @_transparent
  public static func acosh(_ x: Complex<Float80>) -> Complex<Float80> {
    let a = CComplexFloat80(real: x.real, imag: x.imaginary)
    let b = libm_cacoshl(a)
    return Complex<Float80>(b.real, b.imag)
  }

  @_transparent
  public static func asinh(_ x: Complex<Float80>) -> Complex<Float80> {
    let a = CComplexFloat80(real: x.real, imag: x.imaginary)
    let b = libm_casinhl(a)
    return Complex<Float80>(b.real, b.imag)
  }

  @_transparent
  public static func atanh(_ x: Complex<Float80>) -> Complex<Float80> {
    let a = CComplexFloat80(real: x.real, imag: x.imaginary)
    let b = libm_catanhl(a)
    return Complex<Float80>(b.real, b.imag)
  }

  @_transparent
  public static func acos(_ x: Complex<Float80>) -> Complex<Float80> {
    let a = CComplexFloat80(real: x.real, imag: x.imaginary)
    let b = libm_cacosl(a)
    return Complex<Float80>(b.real, b.imag)
  }

  @_transparent
  public static func asin(_ x: Complex<Float80>) -> Complex<Float80> {
    let a = CComplexFloat80(real: x.real, imag: x.imaginary)
    let b = libm_casinl(a)
    return Complex<Float80>(b.real, b.imag)
  }

  @_transparent
  public static func atan(_ x: Complex<Float80>) -> Complex<Float80> {
    let a = CComplexFloat80(real: x.real, imag: x.imaginary)
    let b = libm_catanl(a)
    return Complex<Float80>(b.real, b.imag)
  }

  @_transparent
  public static func pow(_ x: Complex<Float80>, _ y: Complex<Float80>) -> Complex<Float80> {
    let a = CComplexFloat80(real: x.real, imag: x.imaginary)
    let b = CComplexFloat80(real: y.real, imag: y.imaginary)
    let c = libm_cpowl(a, b)
    return Complex<Float80>(c.real, c.imag)
  }

  @_transparent
  public static func pow(_ x: Complex<Float80>, _ n: Int) -> Complex<Float80> {
    let a = CComplexFloat80(real: x.real, imag: x.imaginary)
    let nComplex = CComplexFloat80(real: Float80(n), imag: 0)
    let b = libm_cpowl(a, nComplex)
    return Complex<Float80>(b.real, b.imag)
  }

  @_transparent
  public static func sqrt(_ x: Complex<Float80>) -> Complex<Float80> {
    let a = CComplexFloat80(real: x.real, imag: x.imaginary)
    let b = libm_csqrtl(a)
    return Complex<Float80>(b.real, b.imag)
  }

  @_transparent
  public static func root(_ x: Complex<Float80>, _ n: Int) -> Complex<Float80> {
    let a = CComplexFloat80(real: x.real, imag: x.imaginary)
    let nComplex = CComplexFloat80(real: 1 / Float80(n), imag: 0)
    let b = libm_cpowl(a, nComplex)
    return Complex<Float80>(b.real, b.imag)
  }
}
#endif
