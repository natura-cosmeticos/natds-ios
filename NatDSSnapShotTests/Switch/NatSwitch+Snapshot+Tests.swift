import XCTest
import SnapshotTesting

@testable import NatDS

final class NatSwitchSnapshotTests: XCTestCase {
    var superview: UIView!

    override func setUp() {
        super.setUp()

        superview = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        superview.backgroundColor = .white

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()
    }

    func test_Nat_Switch_normal_is_on_hasValidSnapshot() {
        let systemUnderTest = NatSwitch()

        systemUnderTest.configure(state: .normal)
        systemUnderTest.configure(isOn: true)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_Nat_Switch_normal_is_off_hasValidSnapshot() {
        let systemUnderTest = NatSwitch()

        systemUnderTest.configure(state: .normal)
        systemUnderTest.configure(isOn: false)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_Nat_Switch_focused_is_on_hasValidSnapshot() {
        let systemUnderTest = NatSwitch()

        systemUnderTest.configure(state: .focused)
        systemUnderTest.configure(isOn: true)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_Nat_Switch_focused_is_off_hasValidSnapshot() {
        let systemUnderTest = NatSwitch()

        systemUnderTest.configure(state: .focused)
        systemUnderTest.configure(isOn: false)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_Nat_Switch_disabled_is_on_hasValidSnapshot() {
        let systemUnderTest = NatSwitch()

        systemUnderTest.configure(state: .disabled)
        systemUnderTest.configure(isOn: true)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_Nat_Switch_disabled_is_off_hasValidSnapshot() {
        let systemUnderTest = NatSwitch()

        systemUnderTest.configure(state: .disabled)
        systemUnderTest.configure(isOn: false)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    private func addConstraints(_ systemUnderTest: UIView) {

        systemUnderTest.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            systemUnderTest.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            systemUnderTest.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
