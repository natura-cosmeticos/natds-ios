import XCTest

@testable import NatDS

class TextFieldTypeTests: XCTestCase {
    func test_text_returnsExpectedKeyboardAndTextSettings() {
        let expectedKeyboard = UIKeyboardType.default
        let expectedAutocorrection = UITextAutocorrectionType.yes
        let expectedCapitalization = UITextAutocapitalizationType.none

        let sut = TextFieldType.text

        XCTAssertEqual(sut.keyboard, expectedKeyboard)
        XCTAssertEqual(sut.autoCorrection, expectedAutocorrection)
        XCTAssertEqual(sut.capitalization, expectedCapitalization)
    }

    func test_name_returnsExpectedKeyboardAndTextSettings() {
        let expectedKeyboard = UIKeyboardType.default
        let expectedAutocorrection = UITextAutocorrectionType.no
        let expectedCapitalization = UITextAutocapitalizationType.words

        let sut = TextFieldType.name

        XCTAssertEqual(sut.keyboard, expectedKeyboard)
        XCTAssertEqual(sut.autoCorrection, expectedAutocorrection)
        XCTAssertEqual(sut.capitalization, expectedCapitalization)
    }

    func test_number_returnsExpectedKeyboardAndTextSettings() {
        let expectedKeyboard = UIKeyboardType.numberPad
        let expectedAutocorrection = UITextAutocorrectionType.no
        let expectedCapitalization = UITextAutocapitalizationType.none

        let sut = TextFieldType.number

        XCTAssertEqual(sut.keyboard, expectedKeyboard)
        XCTAssertEqual(sut.autoCorrection, expectedAutocorrection)
        XCTAssertEqual(sut.capitalization, expectedCapitalization)
    }

    func test_password_returnsExpectedKeyboardAndTextSettings() {
        let expectedKeyboard = UIKeyboardType.numberPad
        let expectedAutocorrection = UITextAutocorrectionType.no
        let expectedCapitalization = UITextAutocapitalizationType.none

        let sut = TextFieldType.password(keyboardType: .numberPad)

        XCTAssertEqual(sut.keyboard, expectedKeyboard)
        XCTAssertEqual(sut.autoCorrection, expectedAutocorrection)
        XCTAssertEqual(sut.capitalization, expectedCapitalization)
    }
}
