import XCTest
import SnapshotTesting

@testable import NatDS

final class TextFieldSnapshotTests: XCTestCase {
    var delegateMock: TextFieldDelegateMock!
    var systemUnderTest: TextField!

    override func setUp() {
        super.setUp()

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()

        delegateMock = TextFieldDelegateMock()
        systemUnderTest = TextField(frame: CGRect(x: 0, y: 0, width: 328, height: 99))
        systemUnderTest.backgroundColor = .white

        systemUnderTest.title = "Label"
        systemUnderTest.placeholder = "Placeholder"
        systemUnderTest.helper = "Helper Text"
        systemUnderTest.delegate = delegateMock
    }

    func test_state_whenHasNoFocus_returnEnableStateSnapshot() {
        systemUnderTest.textFieldDidEndEditing(systemUnderTest.textField)

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_state_whenHasFocus_returnActiveStateSnapshot() {
        systemUnderTest.textFieldDidBeginEditing(systemUnderTest.textField)
        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_state_whenHasError_returnErrorStateSnapshot() {
        systemUnderTest.error = "Error: Has an error"
        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_state_whenHasErrorAndLargeMessage_returnMultipleErrorLinesStateSnapshot() {
        systemUnderTest.frame = CGRect(x: 0, y: 0, width: 328, height: 119)
        systemUnderTest.error = """
        Error: Has an error - this input has an error - Neque porro quisquam est qui dolorem ipsum quia
        """
        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_state_whenHasErrorAndLargeMessageWithSmallWidth_returnMultipleErrorLinesAndNotCutIconSnapshot() {
        systemUnderTest.frame = CGRect(x: 0, y: 0, width: 100, height: 119)
        systemUnderTest.error = "Error: Has an error"
        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_text_whenTextIsSet_expectedTextFieldIsFilledSnapshot() {
        systemUnderTest.text = "999.999.999-99"
        assertSnapshot(matching: systemUnderTest, as: .image)
    }
}
