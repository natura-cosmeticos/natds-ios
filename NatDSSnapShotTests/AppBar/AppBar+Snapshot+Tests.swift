import XCTest
import SnapshotTesting

@testable import NatDS

class AppBarSnapshotTests: XCTestCase {
    var systemUnderTest: UINavigationController!

    override func setUp() {
        super.setUp()

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()

        systemUnderTest = UINavigationController(rootViewController: UIViewController())
    }

    func test_appbar_color_primary_hasValidSnapshot() {
        systemUnderTest.configure(color: .primary)

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_appbar_color_default_hasValidSnapshot() {
        systemUnderTest.configure(color: .default)

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_appbar_color_inverse_hasValidSnapshot() {
        systemUnderTest.configure(color: .inverse)

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_appbar_color_none_hasValidSnapshot() {
        systemUnderTest.configure(color: .none)

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_appbar_elevation_hasValidSnapshot() {
        systemUnderTest.configure(color: .default)
        systemUnderTest.configure(elevation: true)

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_appbar_actionRight_hasValidSnapshot() {
        systemUnderTest.configure(color: .default)
        let iconButton = NatIconButton(style: .standardDefault, size: .semi)
        systemUnderTest.visibleViewController?.configure(actionRight: [iconButton])

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_appbar_actionRight_multiple_hasValidSnapshot() {
        systemUnderTest.configure(color: .default)
        let iconButton = NatIconButton(style: .standardDefault, size: .semi)
        let secondIconButton = NatIconButton(style: .standardDefault, size: .semi)
        let thirdIconButton = NatIconButton(style: .standardDefault, size: .semi)
        systemUnderTest.visibleViewController?.configure(actionRight: [iconButton, secondIconButton, thirdIconButton])

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_appbar_actionLeft_hasValidSnapshot() {
        systemUnderTest.configure(color: .default)
        let iconButton = NatIconButton(style: .standardDefault, size: .semi)
        systemUnderTest.visibleViewController?.configure(actionLeft: iconButton)

        assertSnapshot(matching: systemUnderTest, as: .image)
    }
}
