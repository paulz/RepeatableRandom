import XCTest

class FirstTest: XCTestCase {
    func testFirst() {
        XCTAssertEqual(1, 1, "should pass")
    }
    func testSecond() {
        XCTAssertEqual(2, 2, "should pass")
    }
}

class SecondTest: XCTestCase {
    func testSecond() {
        XCTAssertEqual(2, 2, "should pass")
    }
}

class ThirdTest: XCTestCase {
    func testThird() {
        XCTAssertEqual(3, 3, "should pass")
    }
}
