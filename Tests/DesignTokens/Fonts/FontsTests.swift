import XCTest
@testable import NatDS

class FontsTests: XCTestCase {

    func test_h6_returnsExpectedFont() {
        let expectedFont = FontsNatura.h6
        let font = Fonts.h6

        XCTAssertEqual(font, expectedFont)
    }

    func test_body2_returnsExpectedFont() {
        let expectedFont = FontsNatura.body2
        let font = Fonts.body2

        XCTAssertEqual(font, expectedFont)
    }

    func test_button_returnsExpectedFont() {
        let expectedFont = FontsNatura.button
        let font = Fonts.button

        XCTAssertEqual(font, expectedFont)
    }

}
