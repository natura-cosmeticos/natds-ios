import XCTest
@testable import NatDS

class ColorsNaturaTests: XCTestCase {
    func test_primaryOrange_returnsExpectedColor() {
        let expectedColor = UIColor(hex: "#FF6B0B")
        let color = ColorsNatura.Primary.orange

        XCTAssertEqual(color, expectedColor)
    }

    func test_pbGray_returnsExpectedColor() {
        let expectedColor = UIColor(hex: "#333333")
        let color = ColorsNatura.PB.gray

        XCTAssertEqual(color, expectedColor)
    }

    func test_pbGray3_returnsExpectedColor() {
        let expectedColor = UIColor(hex: "#EEEEEE")
        let color = ColorsNatura.PB.gray3

        XCTAssertEqual(color, expectedColor)
    }

}
