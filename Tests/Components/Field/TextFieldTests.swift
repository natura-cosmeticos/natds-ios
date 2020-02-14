import FBSnapshotTestCase
@testable import NatDS

class TextFieldTests: FBSnapshotTestCase {

    var sut: TextField!

    override func setUp() {
        super.setUp()

        sut = TextField(frame: CGRect(x: 0, y: 0, width: 328, height: 99))
        sut.backgroundColor = .white

        sut.info = "Label"
        sut.placeholder = "Placeholder"
        sut.helper = "Helper Text"

        //recordMode = true
    }

    func test_enableState_hasEnableSnapshot() {
        sut.handleEditingDidEnd()
        FBSnapshotVerifyView(sut)
    }

    func test_activeState_hasActiveSnapshot() {
        sut.handleEditingDidBegin()
        FBSnapshotVerifyView(sut)
    }

    func test_errorState_hasErrorSnapshot() {
        sut.error = "Error: Has an error"
        FBSnapshotVerifyView(sut)
    }

    func test_error_whenHasString_expectedStateError() {
        sut.error = "Error: Has an error"
        XCTAssertEqual(sut.state, TextField.State.error)
    }

    func test_error_whenStringIsNil_expectedStateActive() {
        sut.handleEditingDidBegin()
        sut.error = nil
        XCTAssertEqual(sut.state, TextField.State.active)
    }

    func test_error_whenHasString_expectedStateEnable() {
        sut.handleEditingDidEnd()
        sut.error = nil
        XCTAssertEqual(sut.state, TextField.State.enable)
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

}
