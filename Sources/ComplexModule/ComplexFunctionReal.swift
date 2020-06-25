//===--- ComplexFunctionReal.swift ----------------------------*- swift -*-===//
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

#if !os(Windows)
/// Types that conform to ComplexFunctionReal guarantee that there
/// is an implementation of the functions in ElementaryFunctions
/// for Complex<Type> 
public protocol ComplexFunctionReal: Real {
    static func exp(_ x: Complex<Self>) -> Complex<Self>
    static func expMinusOne(_ x: Complex<Self>) -> Complex<Self>
    static func cosh(_ x: Complex<Self>) -> Complex<Self>
    static func sinh(_ x: Complex<Self>) -> Complex<Self>
    static func tanh(_ x: Complex<Self>) -> Complex<Self>
    static func cos(_ x: Complex<Self>) -> Complex<Self>
    static func sin(_ x: Complex<Self>) -> Complex<Self>
    static func tan(_ x: Complex<Self>) -> Complex<Self>
    static func log(_ x: Complex<Self>) -> Complex<Self>
    static func log(onePlus x: Complex<Self>) -> Complex<Self>
    static func acosh(_ x: Complex<Self>) -> Complex<Self>
    static func asinh(_ x: Complex<Self>) -> Complex<Self>
    static func atanh(_ x: Complex<Self>) -> Complex<Self>
    static func acos(_ x: Complex<Self>) -> Complex<Self>
    static func asin(_ x: Complex<Self>) -> Complex<Self>
    static func atan(_ x: Complex<Self>) -> Complex<Self>
    static func pow(_ x: Complex<Self>, _ y: Complex<Self>) -> Complex<Self>
    static func pow(_ x: Complex<Self>, _ n: Int) -> Complex<Self>
    static func sqrt(_ x: Complex<Self>) -> Complex<Self>
    static func root(_ x: Complex<Self>, _ n: Int) -> Complex<Self>   
}
#endif
