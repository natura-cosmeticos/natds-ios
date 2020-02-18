import XCTest
@testable import NatDS

class TextFieldTypeTests: XCTestCase {

    func test_text_returnsExpectedKeyboardAndTextSettings() {
        let expectedKeyboard = UIKeyboardType.default
        let expectedAutocorrection = UITextAutocorrectionType.yes
        let expectedCaptalization = UITextAutocapitalizationType.none

        let sut = TextFieldType.text

        XCTAssertEqual(sut.keyboard, expectedKeyboard)
        XCTAssertEqual(sut.autoCorrection, expectedAutocorrection)
        XCTAssertEqual(sut.capitalization, expectedCaptalization)
    }

    func test_name_returnsExpectedKeyboardAndTextSettings() {
        let expectedKeyboard = UIKeyboardType.default
        let expectedAutocorrection = UITextAutocorrectionType.no
        let expectedCaptalization = UITextAutocapitalizationType.words

        let sut = TextFieldType.name

        XCTAssertEqual(sut.keyboard, expectedKeyboard)
        XCTAssertEqual(sut.autoCorrection, expectedAutocorrection)
        XCTAssertEqual(sut.capitalization, expectedCaptalization)
    }

    func test_number_returnsExpectedKeyboardAndTextSettings() {
        let expectedKeyboard = UIKeyboardType.numberPad
        let expectedAutocorrection = UITextAutocorrectionType.no
        let expectedCaptalization = UITextAutocapitalizationType.none

        let sut = TextFieldType.number

        XCTAssertEqual(sut.keyboard, expectedKeyboard)
        XCTAssertEqual(sut.autoCorrection, expectedAutocorrection)
        XCTAssertEqual(sut.capitalization, expectedCaptalization)
    }
}
