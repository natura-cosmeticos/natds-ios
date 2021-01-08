import XCTest
import SnapshotTesting

@testable import NatDS

final class NatShortcutSnapshotTests: XCTestCase {
    var superview: UIView!

    override func setUp() {
        super.setUp()

        superview = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        superview.backgroundColor = .white

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()
    }

    func test_shortcut_style_contained_primary_hasValidSnapshot() {
        let systemUnderTest = createSystemUnderTest(style: .containedPrimary, text: "Contained")

        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.97))
    }

    func test_shortcut_style_contained_primary_with_ellipsis_hasValidSnapshot() {
        let systemUnderTest = createSystemUnderTest(style: .containedPrimary, text: "Contained / Primary")

        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.97))
    }

    func test_shortcut_style_contained_default_hasValidSnapshot() {
        let systemUnderTest = createSystemUnderTest(style: .containedDefault, text: "Contained")

        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.97))
    }

    func test_shortcut_style_contained_default_with_ellipsis_hasValidSnapshot() {
        let systemUnderTest = createSystemUnderTest(style: .containedDefault, text: "Contained / Default")

        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.97))
    }

    func test_shortcut_style_outlined_primary_hasValidSnapshot() {
        let systemUnderTest = createSystemUnderTest(style: .outlinedPrimary, text: "Outlined")

        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.97))
    }

    func test_shortcut_style_outlined_primary_with_ellipsis_hasValidSnapshot() {
        let systemUnderTest = createSystemUnderTest(style: .outlinedPrimary, text: "Outlined / Primary")

        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.97))
    }

    func test_shortcut_style_outlined_default_hasValidSnapshot() {
        let systemUnderTest = createSystemUnderTest(style: .containedDefault, text: "Outlined")

        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.97))
    }

    func test_shortcut_style_outlined_default_with_ellipsis_hasValidSnapshot() {
        let systemUnderTest = createSystemUnderTest(style: .containedDefault, text: "Outlined / Default")

        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.97))
    }
}

extension NatShortcutSnapshotTests {
    private func createSystemUnderTest(style: NatShortcut.Style, text: String) -> NatShortcut {
        let systemUnderTest = NatShortcut(style: style)
        systemUnderTest.configure(text: text)
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
