import XCTest
import SnapshotTesting

@testable import NatDS

final class CheckboxSnapshotTests: XCTestCase {
    var superview: UIView!

    override func setUp() {
        super.setUp()

        superview = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        superview.backgroundColor = .white

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()
    }

    func test_checkbox_enable_unselected_without_text_hasValidSnapshot() {
        let systemUnderTest = NatCheckbox()

        systemUnderTest.configure(isEnabled: true)
        systemUnderTest.configure(isSelected: false)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_checkbox_enable_selected_without_text_hasValidSnapshot() {
        let systemUnderTest = NatCheckbox()

        systemUnderTest.configure(isEnabled: true)
        systemUnderTest.configure(isSelected: true)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_checkbox_disable_unselected_without_text_hasValidSnapshot() {
        let systemUnderTest = NatCheckbox()

        systemUnderTest.configure(isEnabled: false)
        systemUnderTest.configure(isSelected: false)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_checkbox_disable_selected_without_text_hasValidSnapshot() {
        let systemUnderTest = NatCheckbox()

        systemUnderTest.configure(isEnabled: false)
        systemUnderTest.configure(isSelected: true)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_checkbox_enable_unselected_with_text_hasValidSnapshot() {
        let systemUnderTest = NatCheckbox()

        systemUnderTest.configure(isEnabled: true)
        systemUnderTest.configure(isSelected: false)
        systemUnderTest.configure(text: "Label test")
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_checkbox_enable_selected_with_text_hasValidSnapshot() {
        let systemUnderTest = NatCheckbox()

        systemUnderTest.configure(isEnabled: true)
        systemUnderTest.configure(isSelected: true)
        systemUnderTest.configure(text: "Label test")
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_checkbox_disable_unselected_with_text_hasValidSnapshot() {
        let systemUnderTest = NatCheckbox()
        systemUnderTest.configure(isEnabled: false)
        systemUnderTest.configure(isSelected: false)
        systemUnderTest.configure(text: "Label test")
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_checkbox_disable_selected_with_text_hasValidSnapshot() {
        let systemUnderTest = NatCheckbox()
        systemUnderTest.configure(isEnabled: false)
        systemUnderTest.configure(isSelected: true)
        systemUnderTest.configure(text: "Label test")
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_checkbox_indeterminate_disable_selected_with_text_hasValidSnapshot() {
        let systemUnderTest = NatCheckbox()
        systemUnderTest.configure(isEnabled: false)
        systemUnderTest.configure(isSelected: true)
        systemUnderTest.configure(text: "Label test")
        systemUnderTest.configure(isIndeterminate: true)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_checkbox_indeterminate_enable_selected_with_text_hasValidSnapshot() {
        let systemUnderTest = NatCheckbox()
        systemUnderTest.configure(isEnabled: true)
        systemUnderTest.configure(isSelected: true)
        systemUnderTest.configure(text: "Label test")
        systemUnderTest.configure(isIndeterminate: true)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_checkbox_indeterminate_disable_selected_hasValidSnapshot() {
        let systemUnderTest = NatCheckbox()
        systemUnderTest.configure(isEnabled: false)
        systemUnderTest.configure(isSelected: true)
        systemUnderTest.configure(isIndeterminate: true)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_checkbox_indeterminate_enable_selected_hasValidSnapshot() {
        let systemUnderTest = NatCheckbox()
        systemUnderTest.configure(isEnabled: true)
        systemUnderTest.configure(isSelected: true)
        systemUnderTest.configure(isIndeterminate: true)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_checkbox_indeterminate_disable_unselected_hasValidSnapshot() {
        let systemUnderTest = NatCheckbox()
        systemUnderTest.configure(isEnabled: false)
        systemUnderTest.configure(isSelected: false)
        systemUnderTest.configure(isIndeterminate: true)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_checkbox_indeterminate_enable_unselected_hasValidSnapshot() {
        let systemUnderTest = NatCheckbox()
        systemUnderTest.configure(isEnabled: true)
        systemUnderTest.configure(isSelected: false)
        systemUnderTest.configure(isIndeterminate: true)
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
