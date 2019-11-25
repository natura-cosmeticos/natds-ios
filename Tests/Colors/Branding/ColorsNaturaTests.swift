import XCTest
@testable import NatDS

class ColorsNaturaTests: XCTestCase {
    func test_primaryOrange_returnsExpectedColor() {
        let expectedColor = UIColor(hex: "#FF6B0B")
        let color = ColorsNatura.Primary.orange

        XCTAssertEqual(color, expectedColor)
    }
}
