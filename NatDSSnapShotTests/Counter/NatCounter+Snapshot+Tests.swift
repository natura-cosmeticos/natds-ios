import XCTest
import SnapshotTesting

@testable import NatDS

final class NatCounterSnapshotTests: XCTestCase {
    var superview: UIView!

    override func setUp() {
        super.setUp()

        superview = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        superview.backgroundColor = .white

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()
    }

    func test_counter_semi_size_hasValidSnapshot() {
        let systemUnderTest = NatCounter(size: .semi)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.98))
    }

    func test_counter_medium_size_hasValidSnapshot() {
        let systemUnderTest = NatCounter(size: .medium)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.98))
    }

    func test_counter_with_label_hasValidSnapshot() {
        let systemUnderTest = NatCounter(size: .medium)
        systemUnderTest.configure(label: "Design System")
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.98))
    }

    func test_counter_add_disabled_hasValidSnapshot() {
        let systemUnderTest = NatCounter(size: .medium)
        systemUnderTest.configure(button: .add, state: .disabled)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.98))
    }

    func test_counter_subtract_disabled_hasValidSnapshot() {
        let systemUnderTest = NatCounter(size: .medium)
        systemUnderTest.configure(button: .subtract, state: .disabled)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.98))
    }

    func test_counter_all_buttons_disabled_hasValidSnapshot() {
        let systemUnderTest = NatCounter(size: .medium)
        systemUnderTest.configure(button: .all, state: .disabled)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.98))
    }

    private func addConstraints(_ systemUnderTest: UIView) {

        systemUnderTest.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            systemUnderTest.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            systemUnderTest.centerXAnchor.constraint(equalTo: superview.centerXAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
