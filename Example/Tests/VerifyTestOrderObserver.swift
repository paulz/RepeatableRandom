import XCTest

class VerifyTestOrderObserver: NSObject, XCTestObservation {
    static var shared = VerifyTestOrderObserver()
    func testSuiteDidFinish(_ testSuite: XCTestSuite) {
        print(testSuite.tests)
    }
}
