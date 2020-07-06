//===--- ComplexElementaryTests.swift -------------------------*- swift -*-===//
//
// This source file is part of the Swift Numerics open source project
//
// Copyright (c) 2019 - 2020 Apple Inc. and the Swift Numerics project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

import XCTest
import ComplexModule
import RealModule

#if !os(Windows)
final class ComplexElementaryTests: XCTestCase {

    func randomComplex<T>(_ type: T.Type) -> Complex<T> where T: BinaryFloatingPoint, T: Real,
    T.Exponent: FixedWidthInteger, T.RawSignificand: FixedWidthInteger {
    func randomReal() -> T {
      let exponentRange =
      (T.leastNormalMagnitude.exponent + T.Exponent(T.significandBitCount)) ...
        T.greatestFiniteMagnitude.exponent
      let randomExp = T.Exponent.random(in: exponentRange)
      let randomSig = T.random(in: 1..<2)
      return T.init(sign: .plus, exponent: randomExp, significand: randomSig)
    }
    return Complex<T>(randomReal(), randomReal())
    }


    // MARK: Log accuracy tests
    func testLogAccuracy<T>(accuracy: T)
    where T: BinaryFloatingPoint, T: ComplexFunctionReal,
        T.Exponent: FixedWidthInteger, T.RawSignificand: FixedWidthInteger  {
        for _ in 1...10 {
          let argument = randomComplex(T.self)
          let result = Complex.log(argument)
          let correct = Complex.log_builtin(argument)

          // If both values are non-finite, consider that a success
          if !result.isFinite && !correct.isFinite {
            return
          }

          // If the values are both finite, compare them
          if result.isFinite, correct.isFinite,
          relativeError(result, correct) > accuracy {
            XCTFail()
            print(Mirror(reflecting: T.self).description)
            print("Argument: \(argument)\ncalculated: \(result)\nbuiltin: \(correct)")
            let error = relativeError(result, correct)
            print ("Relative error: \(error)")
            print("\n")
          }
        }
    }

    func testLogAccuracy() {
    testLogAccuracy(accuracy: Float(16))
    testLogAccuracy(accuracy: Double(16))
    #if (arch(i386) || arch(x86_64)) && !os(Windows) && !os(Android)
    testLogAccuracy(accuracy: Float80(16))
    #endif
    }

    func testLogPlusAccuracy() {
        let arg = Complex<Double>(0.00000001)
        let ans = Complex.log(onePlus: arg)
        print(ans)
    }

    // MARK: Accuracy tests
    // Compare the accuracy of ComplexModule's operations
    // against those provided from CLang
    func testFunctionAccuracy<T>(
    _ a: (Complex<T>) -> (Complex<T>),
    _ b: (Complex<T>) -> (Complex<T>),
    accuracy: T)
    where T: BinaryFloatingPoint, T: ComplexFunctionReal,
        T.Exponent: FixedWidthInteger, T.RawSignificand: FixedWidthInteger  {
    for _ in 1...100 {
      let argument = randomComplex(T.self)
      let result = a(argument)
      let correct = b(argument)

      // If both values are non-finite, consider that a success
      if !result.isFinite && !correct.isFinite {
        return
      }

      // If the values are both finite, compare them
      if result.isFinite, correct.isFinite,
      relativeError(result, correct) > accuracy {
        print(Mirror(reflecting: T.self).description)
        print("Argument:   \(argument)\ncalculated: \(result)\nbuiltin:    \(correct)")
        let error = relativeError(result, correct)
        print ("Relative error: \(error)")
        print("\n")
        XCTFail()
      }
    }
    }



    func testExpAccuracy() {
    testFunctionAccuracy(Complex<Float>.exp, Complex<Float>.exp_builtin, accuracy: 16)
    testFunctionAccuracy(Complex<Double>.exp, Complex<Double>.exp_builtin, accuracy: 16)
    #if (arch(i386) || arch(x86_64)) && !os(Windows) && !os(Android)
    testFunctionAccuracy(Complex<Float80>.exp, Complex<Float80>.exp_builtin, accuracy: 16)
    #endif
    }

    func testSqrtAccuracy() {
    testFunctionAccuracy(Complex<Float>.sqrt, Complex<Float>.sqrt_builtin, accuracy: 16)
    testFunctionAccuracy(Complex<Double>.sqrt, Complex<Double>.sqrt_builtin, accuracy: 16)
    #if (arch(i386) || arch(x86_64)) && !os(Windows) && !os(Android)
    testFunctionAccuracy(Complex<Float80>.sqrt, Complex<Float80>.sqrt_builtin, accuracy: 16)
    #endif
    }

    // TODO: Check Float80
    func testCosAccuracy() {
    testFunctionAccuracy(Complex<Float>.cos, Complex<Float>.cos_builtin, accuracy: 16)
    testFunctionAccuracy(Complex<Double>.cos, Complex<Double>.cos_builtin, accuracy: 16)
    #if (arch(i386) || arch(x86_64)) && !os(Windows) && !os(Android)
    //testFunctionAccuracy(Complex<Float80>.cos, Complex<Float80>.cos_builtin, accuracy: 16)
    #endif
    }

    func testSinAccuracy() {
    testFunctionAccuracy(Complex<Float>.sin, Complex<Float>.sin_builtin, accuracy: 16)
    testFunctionAccuracy(Complex<Double>.sin, Complex<Double>.sin_builtin, accuracy: 16)
    #if (arch(i386) || arch(x86_64)) && !os(Windows) && !os(Android)
    testFunctionAccuracy(Complex<Float80>.sin, Complex<Float80>.sin_builtin, accuracy: 16)
    #endif
    }

    func testTanAccuracy() {
    testFunctionAccuracy(Complex<Float>.tan, Complex<Float>.tan_builtin, accuracy: 16)
    testFunctionAccuracy(Complex<Double>.tan, Complex<Double>.tan_builtin, accuracy: 16)
    #if (arch(i386) || arch(x86_64)) && !os(Windows) && !os(Android)
    testFunctionAccuracy(Complex<Float80>.tan, Complex<Float80>.tan_builtin, accuracy: 16)
    #endif
    }

    // Check Float80
    func testCoshAccuracy() {
    testFunctionAccuracy(Complex<Float>.cosh, Complex<Float>.cosh_builtin, accuracy: 16)
    testFunctionAccuracy(Complex<Double>.cosh, Complex<Double>.cosh_builtin, accuracy: 16)
    #if (arch(i386) || arch(x86_64)) && !os(Windows) && !os(Android)
    //testFunctionAccuracy(Complex<Float80>.cosh, Complex<Float80>.cosh_builtin, accuracy: 16)
    #endif
    }

    func testSinhAccuracy() {
    testFunctionAccuracy(Complex<Float>.sinh, Complex<Float>.sinh_builtin, accuracy: 16)
    testFunctionAccuracy(Complex<Double>.sinh, Complex<Double>.sinh_builtin, accuracy: 16)
    #if (arch(i386) || arch(x86_64)) && !os(Windows) && !os(Android)
    testFunctionAccuracy(Complex<Float80>.sinh, Complex<Float80>.sinh_builtin, accuracy: 16)
    #endif
    }


    func testTanhAccuracy() {
    testFunctionAccuracy(Complex<Float>.tanh, Complex<Float>.tanh_builtin, accuracy: 16)
    testFunctionAccuracy(Complex<Double>.tanh, Complex<Double>.tanh_builtin, accuracy: 16)
    #if (arch(i386) || arch(x86_64)) && !os(Windows) && !os(Android)
    testFunctionAccuracy(Complex<Float80>.tanh, Complex<Float80>.tanh_builtin, accuracy: 16)
    #endif
    }

    func testAcosAccuracy() {
    testFunctionAccuracy(Complex<Float>.acos, Complex<Float>.acos_builtin, accuracy: 16)
    testFunctionAccuracy(Complex<Double>.acos, Complex<Double>.acos_builtin, accuracy: 16)
    #if (arch(i386) || arch(x86_64)) && !os(Windows) && !os(Android)
    testFunctionAccuracy(Complex<Float80>.acos, Complex<Float80>.acos_builtin, accuracy: 16)
    #endif
    }

    // TODO: Check calculation
    func testASinAccuracy() {
    testFunctionAccuracy(Complex<Float>.asin, Complex<Float>.asin_builtin, accuracy: 16)
    testFunctionAccuracy(Complex<Double>.asin, Complex<Double>.asin_builtin, accuracy: 16)
    #if (arch(i386) || arch(x86_64)) && !os(Windows) && !os(Android)
    testFunctionAccuracy(Complex<Float80>.asin, Complex<Float80>.asin_builtin, accuracy: 16)
    #endif
    }

    // TODO: Check Double precision and Float80 calculation
    func testAtanAccuracy() {
    testFunctionAccuracy(Complex<Float>.atan, Complex<Float>.atan_builtin, accuracy: 16)
    testFunctionAccuracy(Complex<Double>.atan, Complex<Double>.atan_builtin, accuracy: 16)
    #if (arch(i386) || arch(x86_64)) && !os(Windows) && !os(Android)
    //testFunctionAccuracy(Complex<Float80>.atan, Complex<Float80>.atan_builtin, accuracy: 16)
    #endif
    }

    func testAcoshAccuracy() {
    testFunctionAccuracy(Complex<Float>.acosh, Complex<Float>.acosh_builtin, accuracy: 16)
    testFunctionAccuracy(Complex<Double>.acosh, Complex<Double>.acosh_builtin, accuracy: 16)
    #if (arch(i386) || arch(x86_64)) && !os(Windows) && !os(Android)
    testFunctionAccuracy(Complex<Float80>.acosh, Complex<Float80>.acosh_builtin, accuracy: 16)
    #endif
    }

    // TODO: Check
    func testASinhAccuracy() {
    testFunctionAccuracy(Complex<Float>.asinh, Complex<Float>.asinh_builtin, accuracy: 16)
    testFunctionAccuracy(Complex<Double>.asinh, Complex<Double>.asinh_builtin, accuracy: 16)
    #if (arch(i386) || arch(x86_64)) && !os(Windows) && !os(Android)
    testFunctionAccuracy(Complex<Float80>.asinh, Complex<Float80>.asinh_builtin, accuracy: 16)
    #endif
    }

    func testAtanhAccuracy() {
    testFunctionAccuracy(Complex<Float>.atanh, Complex<Float>.atanh_builtin, accuracy: 16)
    testFunctionAccuracy(Complex<Double>.atanh, Complex<Double>.atanh_builtin, accuracy: 16)
    #if (arch(i386) || arch(x86_64)) && !os(Windows) && !os(Android)
    testFunctionAccuracy(Complex<Float80>.atanh, Complex<Float80>.atanh_builtin, accuracy: 16)
    #endif
    }
}
#endif
