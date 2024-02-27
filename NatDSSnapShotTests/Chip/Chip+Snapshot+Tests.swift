import XCTest
import SnapshotTesting

@testable import NatDS

final class NatChipSnapshotTests: XCTestCase {
    var superview: UIView!

    override func setUp() {
        super.setUp()

        superview = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        superview.backgroundColor = .white

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()
    }

    func test_Nat_Chip_neutral_color() {
        let systemUnderTest = NatChip()

        systemUnderTest.configure(text: "Neutral color")
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_Nat_Chip_primary_color() {
        let systemUnderTest = NatChip(color: .primary)

        systemUnderTest.configure(text: "Primary color")
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_Nat_Chip_secondary_color() {
        let systemUnderTest = NatChip(color: .secondary)

        systemUnderTest.configure(text: "Secondary color")
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_Nat_Chip_custom_color() {
        let systemUnderTest = NatChip(color: .custom(selectedColor: NatColors.alert,
                                                     labelColor: NatColors.lowEmphasis,
                                                     borderColor: NatColors.link))

        systemUnderTest.configure(text: "Custom color")
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_Nat_Chip_semi_size() {
        let systemUnderTest = NatChip(size: .semi)

        systemUnderTest.configure(text: "Semi size")
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_Nat_Chip_semiX_size() {
        let systemUnderTest = NatChip(size: .semiX)

        systemUnderTest.configure(text: "SemiX size")
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_Nat_Chip_medium_size() {
        let systemUnderTest = NatChip(size: .medium)

        systemUnderTest.configure(text: "Medium size")
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_Nat_Chip_with_left_icon() {
        let icon = getIcon(.outlinedDefaultMockup)
        let systemUnderTest = NatChip()
        systemUnderTest.configure(text: "Left icon")
        systemUnderTest.configure(icon: icon, position: .left)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_Nat_Chip_with_right_icon() {
        let icon = getIcon(.outlinedDefaultMockup)
        let systemUnderTest = NatChip()
        systemUnderTest.configure(text: "Right icon")
        systemUnderTest.configure(icon: icon, position: .right)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_Nat_Chip_with_both_sides_icon() {
        let icon = getIcon(.outlinedDefaultMockup)
        let systemUnderTest = NatChip()
        systemUnderTest.configure(text: "Both sides icon")
        systemUnderTest.configure(icon: icon, position: .left)
        systemUnderTest.configure(icon: icon, position: .right)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_Nat_Chip_with_left_avatar() {
        let avatar = NatAvatar(size: .standard, type: .label)
        avatar.configure(name: "Design System")
        let systemUnderTest = NatChip()
        systemUnderTest.configure(text: "Left avatar")
        systemUnderTest.configure(avatar: avatar, position: .left)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_Nat_Chip_with_right_avatar() {
        let avatar = NatAvatar(size: .standard, type: .label)
        avatar.configure(name: "Design System")
        let systemUnderTest = NatChip()
        systemUnderTest.configure(text: "Right avatar")
        systemUnderTest.configure(avatar: avatar, position: .right)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_Nat_Chip_with_icon_and_avatar() {
        let icon = getIcon(.outlinedDefaultMockup)
        let avatar = NatAvatar(size: .standard, type: .label)
        avatar.configure(name: "Design System")
        let systemUnderTest = NatChip()
        systemUnderTest.configure(text: "Icon and avatar")
        systemUnderTest.configure(icon: icon, position: .left)
        systemUnderTest.configure(avatar: avatar, position: .right)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_Nat_Chip_with_avatar_and_icon() {
        let icon = getIcon(.outlinedDefaultMockup)
        let avatar = NatAvatar(size: .standard, type: .label)
        avatar.configure(name: "Design System")
        let systemUnderTest = NatChip()
        systemUnderTest.configure(text: "Avatar and icon")
        systemUnderTest.configure(icon: icon, position: .right)
        systemUnderTest.configure(avatar: avatar, position: .left)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_Nat_Chip_focused_state() {
        let systemUnderTest = NatChip()
        systemUnderTest.configure(text: "Focused")
        systemUnderTest.configure(state: .focused)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_Nat_Chip_disabled_state() {
        let systemUnderTest = NatChip()
        systemUnderTest.configure(text: "Disabled")
        systemUnderTest.configure(state: .disabled)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_Nat_Chip_selected_state() {
        let systemUnderTest = NatChip()
        systemUnderTest.configure(text: "Selected")
        systemUnderTest.configure(state: .selected)
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
