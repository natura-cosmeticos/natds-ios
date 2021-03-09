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
    
    func test_size_whenHasMediumSize_returnMediumSizeSnapshot() {
        systemUnderTest.configure(size: .medium)
        assertSnapshot(matching: systemUnderTest, as: .image)
    }
    
    func test_size_whenHasMediumXSize_returnMediumXSizeSnapshot() {
        systemUnderTest.configure(size: .mediumX)
        assertSnapshot(matching: systemUnderTest, as: .image)
    }
    
    func test_title_whenIsRequired_returnRequiredTitleSnapshot() {
        systemUnderTest.configure(required: true)
        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_state_whenHasNoFocus_returnEnableStateSnapshot() {
        systemUnderTest.textFieldDidEndEditing(systemUnderTest.textField)
        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_state_whenHasFocus_returnActiveStateSnapshot() {
        systemUnderTest.textFieldDidBeginEditing(systemUnderTest.textField)
        assertSnapshot(matching: systemUnderTest, as: .image)
    }
    
    func test_state_whenIsDisabled_returnDisabledStateSnapshot() {
        systemUnderTest.configure(isEnabled: false)
        assertSnapshot(matching: systemUnderTest, as: .image)
    }
    
    func test_state_whenIsReadOnly_returnReadOnlyStateSnapshot() {
        systemUnderTest.configure(readOnly: true)
        assertSnapshot(matching: systemUnderTest, as: .image)
    }
    
    func test_state_whenIsFilled_returnFilledStateSnapshot() {
        systemUnderTest.text = "This textfield is filled"
        XCTAssert(systemUnderTest.interactionState == .filled)
        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_state_whenHasError_returnErrorStateSnapshot() {
        systemUnderTest.configure(state: .error, with: "Error: Has an error")
        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_state_whenHasErrorAndLargeMessage_returnMultipleErrorLinesStateSnapshot() {
        systemUnderTest.frame = CGRect(x: 0, y: 0, width: 328, height: 119)
        systemUnderTest.configure(state: .error, with: """
        Error: Has an error - this input has an error - Neque porro quisquam est qui dolorem ipsum quia
        """)
        assertSnapshot(matching: systemUnderTest, as: .image)
    }
    
    func test_state_whenHasErrorAndLargeMessageWithSmallWidth_returnMultipleErrorLinesAndNotCutIconSnapshot() {
        systemUnderTest.frame = CGRect(x: 0, y: 0, width: 100, height: 119)
        systemUnderTest.configure(state: .error, with: "Error: Has an error")
        assertSnapshot(matching: systemUnderTest, as: .image)
    }
    
    func test_state_whenHasSuccess_returnSuccessStateSnapshot() {
        systemUnderTest.configure(state: .success, with: "Success: Has a success state")
        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_state_whenHasSuccessAndLargeMessage_returnMultipleSuccessLinesStateSnapshot() {
        systemUnderTest.frame = CGRect(x: 0, y: 0, width: 328, height: 119)
        systemUnderTest.configure(state: .success, with: """
        Success: Has a success state - this input has an error - Neque porro quisquam est qui dolorem ipsum quia
        """)
        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_state_whenHasSuccessAndLargeMessageWithSmallWidth_returnMultipleSuccessLinesAndNotCutIconSnapshot() {
        systemUnderTest.frame = CGRect(x: 0, y: 0, width: 100, height: 119)
        systemUnderTest.configure(state: .success, with: "Success: Has a success state")
        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_state_whenHasNoFeedback_returnNeutralStateSnapshot() {
        systemUnderTest.configure(state: .success, with: "Success: Has a success state")
        systemUnderTest.configure(state: .none, with: "")
        assertSnapshot(matching: systemUnderTest, as: .image)
    }
    
    func test_text_whenTextIsSet_expectedTextFieldIsFilledSnapshot() {
        systemUnderTest.text = "999.999.999-99"
        assertSnapshot(matching: systemUnderTest, as: .image(precision: 0.97))
    }

    func test_password_whenVisibilityIconIsSet_expectedShowIconOutlinedActionVisibility() {
        systemUnderTest.type = .password(keyboardType: .default)
        systemUnderTest.text = "999.999.999-99"
        systemUnderTest.showVisibilityIcon()
        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_password_whenVisibilityIconIsSet_expectedShowIconOutlinedActionVisibilityOff() {
        systemUnderTest.type = .password(keyboardType: .default)
        systemUnderTest.text = "999.999.999-99"
        systemUnderTest.showVisibilityIcon()
        systemUnderTest.setIconVisibility()
        assertSnapshot(matching: systemUnderTest, as: .image)
    }
    
    func test_actionIcon_whenHasActionIcon_showsExpectedIconButtonSnapshot() {
        systemUnderTest.configure(icon: nil) {}
        assertSnapshot(matching: systemUnderTest, as: .image)
    }
    
    func test_actionIcon_whenRemovesActionIcon_hidesExpectedIconButtonSnapshot() {
        systemUnderTest.configure(icon: nil) {}
        systemUnderTest.configureRemoveAction()
        assertSnapshot(matching: systemUnderTest, as: .image)
    }
}
