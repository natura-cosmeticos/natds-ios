import FBSnapshotTestCase
@testable import NatDS

class TextFieldTests: FBSnapshotTestCase {

    var sut: TextField!

    override func setUp() {
        super.setUp()

        sut = TextField(frame: CGRect(x: 0, y: 0, width: 328, height: 99))
        sut.backgroundColor = .white

        sut.title = "Label"
        sut.placeholder = "Placeholder"
        sut.helper = "Helper Text"
    }

    func test_state_whenHasNoFocus_returnEnableStateSnapshot() {
        sut.textFieldDidEndEditing(sut.textField)
        FBSnapshotVerifyView(sut)
    }

    func test_state_whenHasFocus_returnActiveStateSnapshot() {
        sut.textFieldDidBeginEditing(sut.textField)
        FBSnapshotVerifyView(sut)
    }

    func test_state_whenHasError_returnErrorStateSnapshot() {
        sut.error = "Error: Has an error"
        FBSnapshotVerifyView(sut)
    }

    func test_text_whenTextIsSet_expectedTextFieldIsFilledSnapshot() {
        sut.text = "999.999.999-99"
        FBSnapshotVerifyView(sut)
    }

    func test_textFieldType_whenTypeIsText_expectedTextKeyboard() {
        sut.type = TextFieldType.text
        XCTAssertEqual(sut.textField.autocapitalizationType, UITextAutocapitalizationType.none)
        XCTAssertEqual(sut.textField.keyboardType, UIKeyboardType.default)
        XCTAssertEqual(sut.textField.autocorrectionType, UITextAutocorrectionType.yes)
    }

//    func test_textFieldType_whenTypeIsNumber_expectedNumberKeyboard() {
//        sut.type = TextField.TextFieldType.number
//        XCTAssertEqual(sut.textField.autocapitalizationType, UITextAutocapitalizationType.none)
//        XCTAssertEqual(sut.textField.keyboardType, UIKeyboardType.numberPad)
//        XCTAssertEqual(sut.textField.autocorrectionType, UITextAutocorrectionType.no)
//    }
}
