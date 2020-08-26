import XCTest
import SnapshotTesting

@testable import NatDS

final class NatShortcutSnapshotTests: XCTestCase {
    var superview: UIView!

    override func setUp() {
        super.setUp()

        superview = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 100))
        superview.backgroundColor = .white

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()
    }

    func test_shortcut_style_contained_primary_hasValidSnapshot() {
        let systemUnderTest = NatShortcut(style: .containedPrimary)
        systemUnderTest.configure(text: "Contained / Primary")
        systemUnderTest.translatesAutoresizingMaskIntoConstraints = false

        superview.addSubview(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_shortcut_style_contained_default_hasValidSnapshot() {
        let systemUnderTest = NatShortcut(style: .containedDefault)
        systemUnderTest.configure(text: "Contained / Default")
        systemUnderTest.translatesAutoresizingMaskIntoConstraints = false

        superview.addSubview(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_shortcut_style_outlined_primary_hasValidSnapshot() {
        let systemUnderTest = NatShortcut(style: .outlinedPrimary)
        systemUnderTest.configure(text: "Outlined / Primary")
        systemUnderTest.translatesAutoresizingMaskIntoConstraints = false

        superview.addSubview(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_shortcut_style_outlined_default_hasValidSnapshot() {
        let systemUnderTest = NatShortcut(style: .containedDefault)
        systemUnderTest.configure(text: "Outlined / Default")
        systemUnderTest.translatesAutoresizingMaskIntoConstraints = false

        superview.addSubview(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }
}
