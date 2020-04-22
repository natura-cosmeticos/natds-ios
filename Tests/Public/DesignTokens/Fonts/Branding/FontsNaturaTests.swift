import XCTest
@testable import NatDS

class FontsNaturaTests: XCTestCase {

    func test_h5_returnsExpectedFont() {
        let expectedFont = UIFont.systemFont(ofSize: 24, weight: .regular)
        let font = FontsNatura.h5

        XCTAssertEqual(font, expectedFont)
    }

    func test_h6_returnsExpectedFont() {
        let expectedFont = UIFont.systemFont(ofSize: 20, weight: .medium)
        let font = FontsNatura.h6

        XCTAssertEqual(font, expectedFont)
    }

    func test_subtitle1_returnsEmpctedFont() {
        let expectedFont = UIFont.systemFont(ofSize: 16, weight: .medium)
        let font = FontsNatura.subtitle1

        XCTAssertEqual(font, expectedFont)
    }

    func test_body1_returnsExpectedFont() {
        let expectedFont = UIFont.systemFont(ofSize: 16, weight: .regular)
        let font = FontsNatura.body1

        XCTAssertEqual(font, expectedFont)
    }

    func test_body2_returnsExpectedFont() {
        let expectedFont = UIFont.systemFont(ofSize: 14, weight: .regular)
        let font = FontsNatura.body2

        XCTAssertEqual(font, expectedFont)
    }

    func test_button_returnsExpectedFont() {
        let expectedFont = UIFont.systemFont(ofSize: 14, weight: .medium)
        let font = FontsNatura.button

        XCTAssertEqual(font, expectedFont)
    }

    func test_caption_returnsExpectedFont() {
        let expectedFont = UIFont.systemFont(ofSize: 12, weight: .regular)
        let font = FontsNatura.caption

        XCTAssertEqual(font, expectedFont)
    }
}
