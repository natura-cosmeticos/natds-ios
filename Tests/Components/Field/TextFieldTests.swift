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

    func test_enableState_whenHasNoFocus_returnEnableStateSnapshot() {
        sut.handleEditingDidEnd()
        FBSnapshotVerifyView(sut)
    }

    func test_activeState_whenHasFocus_returnActiveStateSnapshot() {
        sut.handleEditingDidBegin()
        FBSnapshotVerifyView(sut)
    }

    func test_enableState_whenHasError_returnErrorStateSnapshot() {
        sut.error = "Error: Has an error"
        XCTAssertEqual(sut.state, TextField.State.error)
        FBSnapshotVerifyView(sut)
    }

    func test_text_whenTextIsSet_expectedTextFieldIsFilledSnapshot() {
        sut.text = "999.999.999-99"
        FBSnapshotVerifyView(sut)
    }

    func test_textFieldType_whenTypeIsText_expectedTextKeyboard() {
        sut.type = TextField.TextFieldType.text
        XCTAssertEqual(sut.textField.autocapitalizationType, UITextAutocapitalizationType.none)
        XCTAssertEqual(sut.textField.keyboardType, UIKeyboardType.default)
        XCTAssertEqual(sut.textField.autocorrectionType, UITextAutocorrectionType.yes)
    }

    func test_textFieldType_whenTypeIsNumber_expectedNumberKeyboard() {
        sut.type = TextField.TextFieldType.number
        XCTAssertEqual(sut.textField.autocapitalizationType, UITextAutocapitalizationType.none)
        XCTAssertEqual(sut.textField.keyboardType, UIKeyboardType.numberPad)
        XCTAssertEqual(sut.textField.autocorrectionType, UITextAutocorrectionType.no)
    }

    func test_equals_whenTextFieldIsEqual_expectedTrue() {
        let textField = sut.textField
        XCTAssertTrue(sut.equals(textField: textField))
    }

    func test_equals_whenTextFieldNotEqual_expectedFalse() {
        let textField = UITextField()
        XCTAssertFalse(sut.equals(textField: textField))
    }

}
