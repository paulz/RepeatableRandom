import XCTest

class VerifyTestOrderObserver: NSObject, XCTestObservation {
    static var shared = VerifyTestOrderObserver()
    func testSuiteDidFinish(_ testSuite: XCTestSuite) {
        if testSuite.name == "All tests" {
            assert(
                testSuite.testNames ==
                    [
                        "-[RandomSeed replayingSeed]",
                        "-[FirstTest testSecond]",
                        "-[FirstTest testFirst]",
                        "-[ThirdTest testThird]",
                        "-[SecondTest testSecond]",
                    ]
            )
        }
    }
}

extension XCTestSuite {
    var testNames: [String] {
        tests.map {
            if let suite = $0 as? XCTestSuite {
                return suite.testNames
            } else if let testCase = $0 as? XCTestCase {
                return [testCase.name]
            } else {
                return [name]
            }
        }.reduce([], +)
    }
}
