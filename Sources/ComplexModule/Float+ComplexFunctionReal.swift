//===--- Float+ComplexFunctionsReal.swift ---------------------*- swift -*-===//
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
extension Float: ComplexFunctionReal {
  @_transparent
  public static func exp(_ x: Complex<Float>) -> Complex<Float> {
    let a = CComplexFloat(real: x.real, imag: x.imaginary)
    let b = libm_cexpf(a)
    return Complex<Float>(b.real, b.imag)
  } 

  // TODO: Replace with accurate implementation
  public static func expMinusOne(_ x: Complex<Float>) -> Complex<Float> {
    exp(x) - 1
  }

  @_transparent
  public static func cosh(_ x: Complex<Float>) -> Complex<Float> {
    let a = CComplexFloat(real: x.real, imag: x.imaginary)
    let b = libm_ccoshf(a)
    return Complex<Float>(b.real, b.imag)
  }

  @_transparent
  public static func sinh(_ x: Complex<Float>) -> Complex<Float> {
    let a = CComplexFloat(real: x.real, imag: x.imaginary)
    let b = libm_csinhf(a)
    return Complex<Float>(b.real, b.imag)
  }

  @_transparent
  public static func tanh(_ x: Complex<Float>) -> Complex<Float> {
    let a = CComplexFloat(real: x.real, imag: x.imaginary)
    let b = libm_ctanhf(a)
    return Complex<Float>(b.real, b.imag)
  }

  @_transparent
  public static func cos(_ x: Complex<Float>) -> Complex<Float> {
    let a = CComplexFloat(real: x.real, imag: x.imaginary)
    let b = libm_ccosf(a)
    return Complex<Float>(b.real, b.imag)
  }

  @_transparent
  public static func sin(_ x: Complex<Float>) -> Complex<Float> {
    let a = CComplexFloat(real: x.real, imag: x.imaginary)
    let b = libm_csinf(a)
    return Complex<Float>(b.real, b.imag)
  }

  @_transparent
  public static func tan(_ x: Complex<Float>) -> Complex<Float> {
    let a = CComplexFloat(real: x.real, imag: x.imaginary)
    let b = libm_ctanf(a)
    return Complex<Float>(b.real, b.imag)
  }

  @_transparent
  public static func log(_ x: Complex<Float>) -> Complex<Float> {
    let a = CComplexFloat(real: x.real, imag: x.imaginary)
    let b = libm_clogf(a)
    return Complex<Float>(b.real, b.imag)
  }

  // TODO: Replace with accurate implementation
  public static func log(onePlus x: Complex<Float>) -> Complex<Float> {
    log(1 + x)
  }

  @_transparent
  public static func acosh(_ x: Complex<Float>) -> Complex<Float> {
    let a = CComplexFloat(real: x.real, imag: x.imaginary)
    let b = libm_cacoshf(a)
    return Complex<Float>(b.real, b.imag)
  }

  @_transparent
  public static func asinh(_ x: Complex<Float>) -> Complex<Float> {
    let a = CComplexFloat(real: x.real, imag: x.imaginary)
    let b = libm_casinhf(a)
    return Complex<Float>(b.real, b.imag)
  }

  @_transparent
  public static func atanh(_ x: Complex<Float>) -> Complex<Float> {
    let a = CComplexFloat(real: x.real, imag: x.imaginary)
    let b = libm_catanhf(a)
    return Complex<Float>(b.real, b.imag)
  }

  @_transparent
  public static func acos(_ x: Complex<Float>) -> Complex<Float> {
    let a = CComplexFloat(real: x.real, imag: x.imaginary)
    let b = libm_cacosf(a)
    return Complex<Float>(b.real, b.imag)
  }

  @_transparent
  public static func asin(_ x: Complex<Float>) -> Complex<Float> {
    let a = CComplexFloat(real: x.real, imag: x.imaginary)
    let b = libm_casinf(a)
    return Complex<Float>(b.real, b.imag)
  }

  @_transparent
  public static func atan(_ x: Complex<Float>) -> Complex<Float> {
    let a = CComplexFloat(real: x.real, imag: x.imaginary)
    let b = libm_catanf(a)
    return Complex<Float>(b.real, b.imag)
  }

  @_transparent
  public static func pow(_ x: Complex<Float>, _ y: Complex<Float>) -> Complex<Float> {
    let a = CComplexFloat(real: x.real, imag: x.imaginary)
    let b = CComplexFloat(real: y.real, imag: y.imaginary)
    let c = libm_cpowf(a, b)
    return Complex<Float>(c.real, c.imag)
  }

  @_transparent
  public static func pow(_ x: Complex<Float>, _ n: Int) -> Complex<Float> {
    let a = CComplexFloat(real: x.real, imag: x.imaginary)
    let nComplex = CComplexFloat(real: Float(n), imag: 0)
    let b = libm_cpowf(a, nComplex)
    return Complex<Float>(b.real, b.imag)
  }

  @_transparent
  public static func sqrt(_ x: Complex<Float>) -> Complex<Float> {
    let a = CComplexFloat(real: x.real, imag: x.imaginary)
    let b = libm_csqrtf(a)
    return Complex<Float>(b.real, b.imag)
  }

  @_transparent
  public static func root(_ x: Complex<Float>, _ n: Int) -> Complex<Float> {
    let a = CComplexFloat(real: x.real, imag: x.imaginary)
    let nComplex = CComplexFloat(real: 1 / Float(n), imag: 0)
    let b = libm_cpowf(a, nComplex)
    return Complex<Float>(b.real, b.imag)
  }
}
#endif
