import XCTest
@testable import NatDS

class StringIconTests: XCTestCase {

    func test_rangeFor_returnsExpectedNSRange() {
        let text = "Some text"
        let expectRange = NSRange(location: 0, length: 4)
        let result = text.range(for: "Some")

        XCTAssertEqual(result, expectRange)
    }

}
