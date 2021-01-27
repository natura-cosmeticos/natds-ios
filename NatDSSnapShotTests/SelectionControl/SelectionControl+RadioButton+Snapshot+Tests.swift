import XCTest
import SnapshotTesting

@testable import NatDS

final class SelectionControlRadioButtonSnapshotTests: XCTestCase {
    var superview: UIView!

    override func setUp() {
        super.setUp()

        superview = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        superview.backgroundColor = .white

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()
    }

    func test_Selection_control_radioButton_enable_unselected_without_text_hasValidSnapshot() {
        let systemUnderTest = NatSelectionControl(style: .radioButton)

        systemUnderTest.isEnabled = true
        systemUnderTest.isSelected = false
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_Selection_control_radioButton_enable_selected_without_text_hasValidSnapshot() {
        let systemUnderTest = NatSelectionControl(style: .radioButton)

        systemUnderTest.isEnabled = true
        systemUnderTest.isSelected = true
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_Selection_control_radioButton_disable_unselected_without_text_hasValidSnapshot() {
        let systemUnderTest = NatSelectionControl(style: .radioButton)

        systemUnderTest.isEnabled = false
        systemUnderTest.isSelected = false
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_Selection_control_radioButton_disable_selected_without_text_hasValidSnapshot() {
        let systemUnderTest = NatSelectionControl(style: .radioButton)

        systemUnderTest.isEnabled = false
        systemUnderTest.isSelected = true
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_Selection_control_radioButton_enable_unselected_with_text_hasValidSnapshot() {
        let systemUnderTest = NatSelectionControl(style: .radioButton, text: "Label test")

        systemUnderTest.isEnabled = true
        systemUnderTest.isSelected = false
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_Selection_control_radioButton_enable_selected_with_text_hasValidSnapshot() {
        let systemUnderTest = NatSelectionControl(style: .radioButton, text: "Label test")

        systemUnderTest.isEnabled = true
        systemUnderTest.isSelected = true
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_Selection_control_radioButton_disable_unselected_with_text_hasValidSnapshot() {
        let systemUnderTest = NatSelectionControl(style: .radioButton, text: "Label test")
        systemUnderTest.isEnabled = false
        systemUnderTest.isSelected = false
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_Selection_control_radioButton_disable_selected_with_text_hasValidSnapshot() {
        let systemUnderTest = NatSelectionControl(style: .radioButton, text: "Label test")
        systemUnderTest.isEnabled = false
        systemUnderTest.isSelected = true
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    private func addConstraints(_ systemUnderTest: UIView) {

        systemUnderTest.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            systemUnderTest.topAnchor.constraint(equalTo: superview.topAnchor, constant: 40),
            systemUnderTest.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            systemUnderTest.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
