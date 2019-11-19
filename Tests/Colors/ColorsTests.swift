import XCTest
@testable import NatDS

class ColorsTests: XCTestCase {
    func testPrimaryColor() {
        XCTAssertEqual(Colors.primary, .orange)
    }
}
