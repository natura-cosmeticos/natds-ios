import XCTest
import SnapshotTesting

@testable import NatDS

final class TextFieldTests: XCTestCase {
    var delegateMock: TextFieldDelegateMock!
    var sut: TextField!

    override func setUp() {
        super.setUp()

        DesignSystem().configure(with: .natura)

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

        assertSnapshot(matching: sut, as: .image)
    }

    func test_state_whenHasFocus_returnActiveStateSnapshot() {
        sut.textFieldDidBeginEditing(sut.textField)
        assertSnapshot(matching: sut, as: .image)
    }

    func test_state_whenHasError_returnErrorStateSnapshot() {
        sut.error = "Error: Has an error"
        assertSnapshot(matching: sut, as: .image)
    }

    func test_state_whenHasErrorAndLargeMessage_returnMultipleErrorLinesStateSnapshot() {
        sut.frame = CGRect(x: 0, y: 0, width: 328, height: 119)
        sut.error = "Error: Has an error - this input has an error - Neque porro quisquam est qui dolorem ipsum quia"
        assertSnapshot(matching: sut, as: .image)
    }

    func test_state_whenHasErrorAndLargeMessageWithSmallWidth_returnMultipleErrorLinesAndNotCutIconSnapshot() {
        sut.frame = CGRect(x: 0, y: 0, width: 100, height: 119)
        sut.error = "Error: Has an error"
        assertSnapshot(matching: sut, as: .image)
    }

    func test_text_whenTextIsSet_expectedTextFieldIsFilledSnapshot() {
        sut.text = "999.999.999-99"
        assertSnapshot(matching: sut, as: .image)
    }
}
