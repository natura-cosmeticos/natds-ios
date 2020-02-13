import XCTest
@testable import NatDS

class ColorsNaturaTests: XCTestCase {

    func test_primary_orange_returnsExpectedColor() {
        let expectedColor = UIColor(hex: "#FF6B0B")
        let color = ColorsNatura.Primary.orange

        XCTAssertEqual(color, expectedColor)
    }

    func test_primary_yellow_returnsExpectedColor() {
        let expectedColor = UIColor(hex: "#F4AB34")
        let color = ColorsNatura.Primary.yellow

        XCTAssertEqual(color, expectedColor)
    }

    func test_pb_gray_returnsExpectedColor() {
        let expectedColor = UIColor(hex: "#333333")
        let color = ColorsNatura.PB.gray

        XCTAssertEqual(color, expectedColor)
    }

    func test_pb_gray2_returnsExpectedColor() {
        let expectedColor = UIColor(hex: "#BBBBBB")
        let color = ColorsNatura.PB.gray2

        XCTAssertEqual(color, expectedColor)
    }

    func test_pb_gray3_returnsExpectedColor() {
        let expectedColor = UIColor(hex: "#EEEEEE")
        let color = ColorsNatura.PB.gray3

        XCTAssertEqual(color, expectedColor)
    }

    func test_pb_black_returnsExpectedColor() {
        let expectedColor = UIColor(hex: "#000000")
        let color = ColorsNatura.PB.black

        XCTAssertEqual(color, expectedColor)
    }

    func test_content_whenIsMediumEmphasis_returnsExpectedColor() {
        let expectedColor = UIColor(hex: "#777777")
        let color = ColorsNatura.Content.mediumEmphasis

        XCTAssertEqual(color, expectedColor)
    }
}
