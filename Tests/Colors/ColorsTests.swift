import XCTest
@testable import NatDS

class ColorsTests: XCTestCase {
    func test_primary_returnsExpectedColor() {
        let expectedColor = ColorsNatura.Primary.orange
        let color = Colors.primary

        XCTAssertEqual(color, expectedColor)
    }
}
