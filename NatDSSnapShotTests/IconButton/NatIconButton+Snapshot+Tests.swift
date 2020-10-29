import XCTest
import SnapshotTesting

@testable import NatDS

final class NatIconButtonSnapshotTests: XCTestCase {
    var superview: UIView!

    override func setUp() {
        super.setUp()

        superview = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 100))
        superview.backgroundColor = .white

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()
    }

    func test_style_standard_color_default_hasValidSnapshot() {
        let systemUnderTest = NatIconButton(style: .standardDefault)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
        assertSnapshot(matching: systemUnderTest, as: .recursiveDescription)
    }

    func test_style_standard_color_default_disabled_hasValidSnapshot() {
        let systemUnderTest = NatIconButton(style: .standardDefault)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        systemUnderTest.configure(state: .disabled)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_style_standard_color_default_pressed_hasValidSnapshot() {
        let systemUnderTest = NatIconButton(style: .standardDefault)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        systemUnderTest.touchesBegan(.init(arrayLiteral: .init()), with: nil)

        assertSnapshot(matching: systemUnderTest, as: .recursiveDescription)
    }

    func test_style_standard_color_default_tapped_hasValidSnapshot() {
        let systemUnderTest = NatIconButton(style: .standardDefault)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        systemUnderTest.touchesBegan(.init(arrayLiteral: .init()), with: nil)
        systemUnderTest.touchesEnded(.init(), with: nil)

        assertSnapshot(matching: superview, as: .image)
        assertSnapshot(matching: systemUnderTest, as: .recursiveDescription)
    }

    func test_style_standard_color_default_with_badge_hasValidSnapshot() {
        let systemUnderTest = NatIconButton(style: .standardDefault)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        systemUnderTest.configure(badgeStyle: .standard, withColor: .alert)
        systemUnderTest.setBadge(count: 10)

        assertSnapshot(matching: superview, as: .image)
        assertSnapshot(matching: systemUnderTest, as: .recursiveDescription)
    }

    func test_style_standard_color_primary_hasValidSnapshot() {
        let systemUnderTest = NatIconButton(style: .standardPrimary)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
        assertSnapshot(matching: systemUnderTest, as: .recursiveDescription)
    }

    func test_style_standard_color_primary_disabled_hasValidSnapshot() {
        let systemUnderTest = NatIconButton(style: .standardPrimary)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        systemUnderTest.configure(state: .disabled)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_style_standard_color_primary_pressed_hasValidSnapshot() {
        let systemUnderTest = NatIconButton(style: .standardPrimary)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        systemUnderTest.touchesBegan(.init(arrayLiteral: .init()), with: nil)

        assertSnapshot(matching: systemUnderTest, as: .recursiveDescription)
    }

    func test_style_standard_color_primary_tapped_hasValidSnapshot() {
        let systemUnderTest = NatIconButton(style: .standardPrimary)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        systemUnderTest.touchesBegan(.init(arrayLiteral: .init()), with: nil)
        systemUnderTest.touchesEnded(.init(), with: nil)

        assertSnapshot(matching: superview, as: .image)
        assertSnapshot(matching: systemUnderTest, as: .recursiveDescription)
    }

    func test_style_standard_color_primary_with_badge_hasValidSnapshot() {
        let systemUnderTest = NatIconButton(style: .standardPrimary)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        systemUnderTest.configure(badgeStyle: .standard, withColor: .alert)
        systemUnderTest.setBadge(count: 10)

        assertSnapshot(matching: superview, as: .image)
        assertSnapshot(matching: systemUnderTest, as: .recursiveDescription)
    }
}

extension NatIconButtonSnapshotTests {
    private func addConstraints(_ systemUnderTest: UIView) {
        systemUnderTest.translatesAutoresizingMaskIntoConstraints = false

        let size: CGFloat = NatIconButton.Sizes.semiX

        let constraints = [
            systemUnderTest.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            systemUnderTest.centerYAnchor.constraint(equalTo: superview.centerYAnchor),

            systemUnderTest.heightAnchor.constraint(equalToConstant: size),
            systemUnderTest.widthAnchor.constraint(equalToConstant: size)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
