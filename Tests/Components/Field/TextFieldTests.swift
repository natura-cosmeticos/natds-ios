import FBSnapshotTestCase
@testable import NatDS

class TextFieldTests: FBSnapshotTestCase {

    var delegateMock: TextFieldDelegateMock!
    var sut: TextField!

    override func setUp() {
        super.setUp()

        delegateMock = TextFieldDelegateMock()
        sut = TextField(frame: CGRect(x: 0, y: 0, width: 328, height: 99))
        sut.backgroundColor = .white

        sut.title = "Label"
        sut.placeholder = "Placeholder"
        sut.helper = "Helper Text"
        sut.delegate = delegateMock
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

    func test_textFieldDelegate_whenHasDelegateAndCallDidEndEditing_expectInvokeTextFieldDelegate() {
        sut.textFieldDidEndEditing(sut.textField)

        XCTAssertEqual(delegateMock.invokedDidEndEditing.count, 1)
        XCTAssertEqual(delegateMock.invokedDidEndEditing.field, sut)
    }

    func test_textFieldDelegate_whenHasDelegateAndCallDidBeginEditing_expectInvokeTextFieldDelegate() {
        sut.textFieldDidBeginEditing(sut.textField)

        XCTAssertEqual(delegateMock.invokedDidBeginEditing.count, 1)
        XCTAssertEqual(delegateMock.invokedDidBeginEditing.field, sut)
    }

    func test_textFieldDelegate_whenHasDelegateAndCallShouldBeginEditing_expectInvokeTextFieldDelegate() {
        _ = sut.textFieldShouldBeginEditing(sut.textField)

        XCTAssertEqual(delegateMock.invokedDidShouldBeginEditing.count, 1)
        XCTAssertEqual(delegateMock.invokedDidShouldBeginEditing.field, sut)
    }

    func test_textFieldDelegate_whenHasDelegateAndCallShouldChangeCharacterInRange_expectInvokeTextFieldDelegate() {
        _ = sut.textField(sut.textField, shouldChangeCharactersIn: NSRange(), replacementString: "")

        XCTAssertEqual(delegateMock.invokedTextFieldChangeCharInRange.count, 1)
        XCTAssertEqual(delegateMock.invokedTextFieldChangeCharInRange.field, sut)
    }
}
