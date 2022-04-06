import XCTest
import SnapshotTesting

@testable import NatDS

final class NatShortcutSnapshotTests: XCTestCase {
    var superview: UIView!

    override func setUp() {
        super.setUp()

        superview = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 100))
        superview.backgroundColor = .white

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()
    }

    func test_shortcut_style_contained_primary_hasValidSnapshot() {
        let systemUnderTest = createSystemUnderTest(style: .contained, color: .primary, text: "Contained")

        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_shortcut_style_contained_primary_with_ellipsis_hasValidSnapshot() {
        let systemUnderTest = createSystemUnderTest(style: .contained, color: .primary, text: "Contained / Primary")
        systemUnderTest.configureText(numberOfLines: 1, lineBreakMode: .byTruncatingTail)

        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_shortcut_style_contained_primary_with_lineBreak_hasValidSnapshot() {
        let systemUnderTest = createSystemUnderTest(style: .contained, color: .primary, text: "Contained / Primary")

        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.98))
    }

    func test_shortcut_style_contained_primary_with_badge_hasValidSnapshot() {
        let systemUnderTest = createSystemUnderTest(style: .contained, color: .primary,
                                                    text: "Contained", badgeValue: 10)

        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_shortcut_style_contained_neutral_hasValidSnapshot() {
        let systemUnderTest = createSystemUnderTest(style: .contained, color: .neutral, text: "Contained")

        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_shortcut_style_contained_neutral_with_ellipsis_hasValidSnapshot() {
        let systemUnderTest = createSystemUnderTest(style: .contained, color: .neutral, text: "Contained / Default")
        systemUnderTest.configureText(numberOfLines: 1, lineBreakMode: .byTruncatingTail)

        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_shortcut_style_contained_neutral_with_lineBreak_hasValidSnapshot() {
        let systemUnderTest = createSystemUnderTest(style: .contained, color: .neutral, text: "Contained / Default")

        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_shortcut_style_contained_neutral_with_badge_hasValidSnapshot() {
        let systemUnderTest = createSystemUnderTest(style: .contained, color: .neutral,
                                                    text: "Contained", badgeValue: 10)

        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_shortcut_style_contained_neutral_disabled_hasValidSnapshot() {
        let systemUnderTest = createSystemUnderTest(style: .contained, color: .neutral, text: "Contained")
        systemUnderTest.isEnabled = false

        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_shortcut_style_contained_primary_disabled_hasValidSnapshot() {
        let systemUnderTest = createSystemUnderTest(style: .contained, color: .primary, text: "Contained")
        systemUnderTest.isEnabled = false

        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_shortcut_style_outlined_primary_hasValidSnapshot() {
        let systemUnderTest = createSystemUnderTest(style: .outlined, color: .primary, text: "Outlined")

        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_shortcut_style_outlined_primary_with_ellipsis_hasValidSnapshot() {
        let systemUnderTest = createSystemUnderTest(style: .outlined, color: .primary, text: "Outlined / Primary")
        systemUnderTest.configureText(numberOfLines: 1, lineBreakMode: .byTruncatingTail)

        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_shortcut_style_outlined_primary_with_lineBreak_hasValidSnapshot() {
        let systemUnderTest = createSystemUnderTest(style: .outlined, color: .primary, text: "Outlined / Primary")

        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.98))
    }

    func test_shortcut_style_outlined_primary_with_badge_hasValidSnapshot() {
        let systemUnderTest = createSystemUnderTest(style: .outlined, color: .primary, text: "Outlined", badgeValue: 10)

        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_shortcut_style_outlined_neutral_hasValidSnapshot() {
        let systemUnderTest = createSystemUnderTest(style: .outlined, color: .neutral, text: "Outlined")

        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_shortcut_style_outlined_neutral_with_ellipsis_hasValidSnapshot() {
        let systemUnderTest = createSystemUnderTest(style: .outlined, color: .neutral, text: "Outlined / Default")
        systemUnderTest.configureText(numberOfLines: 1, lineBreakMode: .byTruncatingTail)

        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_shortcut_style_outlined_neutral_with_lineBreak_hasValidSnapshot() {
        let systemUnderTest = createSystemUnderTest(style: .outlined, color: .neutral, text: "Outlined / Default")

        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_shortcut_style_outlined_neutral_with_badge_hasValidSnapshot() {
        let systemUnderTest = createSystemUnderTest(style: .outlined, color: .neutral, text: "Outlined", badgeValue: 10)

        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_shortcut_style_outlined_primary_disabled_hasValidSnapshot() {
        let systemUnderTest = createSystemUnderTest(style: .outlined, color: .primary, text: "Contained")
        systemUnderTest.isEnabled = false

        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_shortcut_style_outlined_neutral_disabled_hasValidSnapshot() {
        let systemUnderTest = createSystemUnderTest(style: .outlined, color: .neutral, text: "Contained")
        systemUnderTest.isEnabled = false

        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }
}

extension NatShortcutSnapshotTests {
    private func createSystemUnderTest(style: NatShortcut.Style,
                                       color: NatShortcut.Color,
                                       text: String,
                                       badgeValue: Int = 0) -> NatShortcut {
        let systemUnderTest = NatShortcut(style: style, color: color, text: text)
        let badge = NatBadge(style: .standard, color: .alert)
        badge.configure(count: badgeValue)
        systemUnderTest.configure(badge: badge)
        systemUnderTest.translatesAutoresizingMaskIntoConstraints = false

        return systemUnderTest
    }

    private func addConstraints(_ systemUnderTest: UIView) {
        let constraints = [
            systemUnderTest.topAnchor.constraint(equalTo: superview.topAnchor),
            systemUnderTest.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            systemUnderTest.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            systemUnderTest.leadingAnchor.constraint(equalTo: superview.leadingAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
