import XCTest
import SnapshotTesting

@testable import NatDS

final class NatLogoSnapshotTests: XCTestCase {
    var superview: UIView!

    override func setUp() {
        super.setUp()
        superview = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
        superview.backgroundColor = .white

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()
    }

    func test_init_modelA_colorNeutral_sizeVeryHuge_hasValidSnapshot() {
        let systemUnderTest = NatLogo()
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_modelB_hasValidSnapshot() {
        let systemUnderTest = NatLogo()
        systemUnderTest.configure(model: .modelB)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_colorPrimary_hasValidSnapshot() {
        let systemUnderTest = NatLogo()
        systemUnderTest.configure(color: .primary)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_colorSecondary_hasValidSnapshot() {
        let systemUnderTest = NatLogo()
        systemUnderTest.configure(color: .secondary)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_colorHighlight_hasValidSnapshot() {
        let systemUnderTest = NatLogo()
        systemUnderTest.configure(color: .highlight)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_colorSurface_hasValidSnapshot() {
        let systemUnderTest = NatLogo()
        systemUnderTest.configure(color: .surface)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_sizeMedium_hasValidSnapshot() {
        let systemUnderTest = NatLogo(size: .medium)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.99))
    }

    func test_sizeMediumX_hasValidSnapshot() {
        let systemUnderTest = NatLogo(size: .mediumX)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.99))
    }

    func test_sizeLarge_hasValidSnapshot() {
        let systemUnderTest = NatLogo(size: .large)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.99))
    }

    func test_sizeLargeX_hasValidSnapshot() {
        let systemUnderTest = NatLogo(size: .largeX)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.99))
    }

    func test_sizeLargeXX_hasValidSnapshot() {
        let systemUnderTest = NatLogo(size: .largeXX)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.99))
    }

    func test_sizeLargeXXX_hasValidSnapshot() {
        let systemUnderTest = NatLogo(size: .largeXXX)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.99))
    }

    func test_sizeHuge_hasValidSnapshot() {
        let systemUnderTest = NatLogo(size: .huge)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.99))
    }

    func test_sizeHugeX_hasValidSnapshot() {
        let systemUnderTest = NatLogo(size: .hugeX)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.99))
    }

    func test_sizeHugeXX_hasValidSnapshot() {
        let systemUnderTest = NatLogo(size: .hugeXX)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.99))
    }

    func test_sizeHugeXXX_hasValidSnapshot() {
        let systemUnderTest = NatLogo(size: .hugeXXX)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.99))
    }
}

extension NatLogoSnapshotTests {
    private func addConstraints(_ systemUnderTest: UIView) {
        systemUnderTest.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            systemUnderTest.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            systemUnderTest.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
