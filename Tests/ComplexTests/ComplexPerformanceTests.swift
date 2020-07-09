import XCTest
import ComplexModule
import RealModule

// Measure the speed of native Swift complex operators
// against that of the CLang builtins
final class ComplexPerformanceTests: XCTestCase {


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

    func testExpPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        measure {
            for i in 1..<10000 {
                let _ = Complex.exp(values[i])
            }
        }
    }

    func testExpBuiltinPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        measure {
            for i in 0..<10000 {
                let _ = Complex.exp_builtin(values[i])
            }
        }
    }

    func testPowPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        let powers = (0..<10000).map { _ in
            Int.random(in: 0...Int.max)
        }
        measure {
            for i in 1..<10000 {
                let _ = Complex.pow(values[i], powers[i])
            }
        }
    }

    func testPowBuiltinPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        let powers = (0..<10000).map { _ in
            Complex<Double>(Int.random(in: 0...Int.max))
        }
        measure {
            for i in 0..<10000 {
                let _ = Complex.pow_builtin(values[i], powers[i])
            }
        }
    }
    
    func testSqrtPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        measure {
            for i in 1..<10000 {
                let _ = Complex.sqrt(values[i])
            }
        }
    }

    func testSqrtBuiltinPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        measure {
            for i in 0..<10000 {
                let _ = Complex.sqrt_builtin(values[i])
            }
        }
    }
    
    func testLogPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        measure {
            for i in 1..<10000 {
                let _ = Complex.log(values[i])
            }
        }
    }

    func testLogBuiltinPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        measure {
            for i in 0..<10000 {
                let _ = Complex.log_builtin(values[i])
            }
        }
    }

    func testCosPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        measure {
            for i in 1..<10000 {
                let _ = Complex.cos(values[i])
            }
        }
    }

    func testCosBuiltinPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        measure {
            for i in 0..<10000 {
                let _ = Complex.cos_builtin(values[i])
            }
        }
    }

    func testSinPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        measure {
            for i in 1..<10000 {
                let _ = Complex.sin(values[i])
            }
        }
    }

    func testSinBuiltinPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        measure {
            for i in 0..<10000 {
                let _ = Complex.sin_builtin(values[i])
            }
        }
    }

    func testTanPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        measure {
            for i in 1..<10000 {
                let _ = Complex.tan(values[i])
            }
        }
    }

    func testTanBuiltinPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        measure {
            for i in 0..<10000 {
                let _ = Complex.tan_builtin(values[i])
            }
        }
    }
    
    func testCoshPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        measure {
            for i in 1..<10000 {
                let _ = Complex.cosh(values[i])
            }
        }
    }

    func testCoshBuiltinPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        measure {
            for i in 0..<10000 {
                let _ = Complex.cosh_builtin(values[i])
            }
        }
    }
    
    func testSinhPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        measure {
            for i in 1..<10000 {
                let _ = Complex.sinh(values[i])
            }
        }
    }

    func testSinhBuiltinPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        measure {
            for i in 0..<10000 {
                let _ = Complex.sinh_builtin(values[i])
            }
        }
    }
    
    func testTanhPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        measure {
            for i in 1..<10000 {
                let _ = Complex.tanh(values[i])
            }
        }
    }

    func testTanhBuiltinPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        measure {
            for i in 0..<10000 {
                let _ = Complex.tanh_builtin(values[i])
            }
        }
    }
    
    func testAcosPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        measure {
            for i in 1..<10000 {
                let _ = Complex.acos(values[i])
            }
        }
    }

    func testAcosBuiltinPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        measure {
            for i in 0..<10000 {
                let _ = Complex.acos_builtin(values[i])
            }
        }
    }

    func testAsinPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        measure {
            for i in 1..<10000 {
                let _ = Complex.asin(values[i])
            }
        }
    }

    func testAsinBuiltinPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        measure {
            for i in 0..<10000 {
                let _ = Complex.asin_builtin(values[i])
            }
        }
    }
    
    func testAtanPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        measure {
            for i in 1..<10000 {
                let _ = Complex.atan(values[i])
            }
        }
    }

    func testAtanBuiltinPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        measure {
            for i in 0..<10000 {
                let _ = Complex.atan_builtin(values[i])
            }
        }
    }
    
    func testAcoshPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        measure {
            for i in 1..<10000 {
                let _ = Complex.acosh(values[i])
            }
        }
    }

    func testAcoshBuiltinPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        measure {
            for i in 0..<10000 {
                let _ = Complex.acosh_builtin(values[i])
            }
        }
    }
    
    func testAsinhPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        measure {
            for i in 1..<10000 {
                let _ = Complex.asinh(values[i])
            }
        }
    }

    func testAsinhBuiltinPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        measure {
            for i in 0..<10000 {
                let _ = Complex.asinh_builtin(values[i])
            }
        }
    }
    
    func testAtanhPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        measure {
            for i in 1..<10000 {
                let _ = Complex.atanh(values[i])
            }
        }
    }

    func testAtanhBuiltinPerformance() {
        let values = (0..<10000).map { _ in
            randomComplex(Double.self)
        }
        measure {
            for i in 0..<10000 {
                let _ = Complex.atanh_builtin(values[i])
            }
        }
    }
}
