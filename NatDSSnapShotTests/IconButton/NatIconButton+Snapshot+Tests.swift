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

    // MARK: - Color default (highEmphasis)

    func test_style_standard_color_default_hasValidSnapshot() {
        let systemUnderTest = NatIconButton(style: .standardDefault)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.97))
        assertSnapshot(matching: systemUnderTest, as: .recursiveDescription)
    }

    func test_style_standard_color_default_disabled_hasValidSnapshot() {
        let systemUnderTest = NatIconButton(style: .standardDefault)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        systemUnderTest.configure(state: .disabled)

        assertSnapshot(matching: superview, as: .image(precision: 0.97))
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

        assertSnapshot(matching: superview, as: .image(precision: 0.97))
        assertSnapshot(matching: systemUnderTest, as: .recursiveDescription)
    }

    func test_style_standard_color_default_with_badge_hasValidSnapshot() {
        let systemUnderTest = NatIconButton(style: .standardDefault)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        let badge = NatBadge(style: .standard, color: .alert)
        badge.configure(count: 10)
        systemUnderTest.configure(badge: badge)

        assertSnapshot(matching: superview, as: .image(precision: 0.97))
        assertSnapshot(matching: systemUnderTest, as: .recursiveDescription)
    }

    func test_style_standard_color_default_with_float_background_hasValidSnapshot() {
        let systemUnderTest = NatIconButton(style: .standardDefault)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        systemUnderTest.configure(background: .float)

        assertSnapshot(matching: superview, as: .image(precision: 0.99))
    }

    func test_style_standard_color_default_with_overlay_background_hasValidSnapshot() {
        let systemUnderTest = NatIconButton(style: .standardDefault)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        systemUnderTest.configure(background: .overlay)

        assertSnapshot(matching: superview, as: .image(precision: 0.99))
    }

    func test_style_standard_color_default_with_size_medium_hasValidSnapshot() {
        let systemUnderTest = NatIconButton(style: .standardDefault, size: .medium)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.99))
    }

    func test_style_standard_color_default_with_size_semiX_hasValidSnapshot() {
        let systemUnderTest = NatIconButton(style: .standardDefault, size: .semiX)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.99))
    }

    // MARK: - Color primary

    func test_style_standard_color_primary_hasValidSnapshot() {
        let systemUnderTest = NatIconButton(style: .standardPrimary)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.97))
        assertSnapshot(matching: systemUnderTest, as: .recursiveDescription)
    }

    func test_style_standard_color_primary_disabled_hasValidSnapshot() {
        let systemUnderTest = NatIconButton(style: .standardPrimary)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        systemUnderTest.configure(state: .disabled)

        assertSnapshot(matching: superview, as: .image(precision: 0.97))
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

        assertSnapshot(matching: superview, as: .image(precision: 0.97))
        assertSnapshot(matching: systemUnderTest, as: .recursiveDescription)
    }

    func test_style_standard_color_primary_with_badge_hasValidSnapshot() {
        let systemUnderTest = NatIconButton(style: .standardPrimary)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        let badge = NatBadge(style: .standard, color: .alert)
        badge.configure(count: 10)
        systemUnderTest.configure(badge: badge)

        assertSnapshot(matching: superview, as: .image(precision: 0.97))
        assertSnapshot(matching: systemUnderTest, as: .recursiveDescription)
    }

    func test_style_standard_color_primary_with_float_background_hasValidSnapshot() {
        let systemUnderTest = NatIconButton(style: .standardPrimary)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        systemUnderTest.configure(background: .float)

        assertSnapshot(matching: superview, as: .image(precision: 0.99))
    }

    func test_style_standard_color_primary_with_overlay_background_hasValidSnapshot() {
        let systemUnderTest = NatIconButton(style: .standardPrimary)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        systemUnderTest.configure(background: .overlay)

        assertSnapshot(matching: superview, as: .image(precision: 0.99))
    }

    func test_style_standard_color_primary_with_size_medium_hasValidSnapshot() {
        let systemUnderTest = NatIconButton(style: .standardPrimary, size: .medium)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.99))
    }

    func test_style_standard_color_primary_with_size_semiX_hasValidSnapshot() {
        let systemUnderTest = NatIconButton(style: .standardPrimary, size: .semiX)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.99))
    }
}

extension NatIconButtonSnapshotTests {
    private func addConstraints(_ systemUnderTest: UIView) {
        systemUnderTest.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            systemUnderTest.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            systemUnderTest.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
