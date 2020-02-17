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

    func test_type_whenTypeIsText_expectedTypeSetup() {
        let expectedType = TextFieldType.text
        sut.type = expectedType

        XCTAssertEqual(sut.textField.keyboardType, expectedType.keyboard)
        XCTAssertEqual(sut.textField.autocorrectionType, expectedType.autoCorrection)
        XCTAssertEqual(sut.textField.autocapitalizationType, expectedType.capitalization)
    }
}
