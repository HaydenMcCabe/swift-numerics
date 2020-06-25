import XCTest
import ComplexModule
import RealModule

#if !os(Windows)
final class ComplexElementaryTests: XCTestCase {
  
  func testExp<T: ComplexFunctionReal>(_ type: T.Type) {
    XCTAssertEqual(Complex<T>.exp(Complex<T>.zero), Complex<T>(1,0))
  }

  func testExp() {
    testExp(Float.self)
    testExp(Double.self)
    #if (arch(i386) || arch(x86_64)) && !os(Windows) && !os(Android)
    testExp(Float80.self)
    #endif
  }
}
#endif
