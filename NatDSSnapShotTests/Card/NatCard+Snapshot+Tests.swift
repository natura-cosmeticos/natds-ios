import XCTest
import SnapshotTesting

@testable import NatDS

final class NatCardSnapshotTests: XCTestCase {
    var superview: UIView!

    override func setUp() {
        super.setUp()

        superview = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()
        superview.backgroundColor = NatColors.background
    }

    func test_NatCard_basic_hasValidSnapshot() {
        let systemUnderTest = NatCard()
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_NatCard_with_elevation_hasValidSnapshot() {
        let systemUnderTest = NatCard()
        systemUnderTest.configure(elevation: true)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_NatCard_with_border_Radius_hasValidSnapshot() {
        let systemUnderTest = NatCard()
        systemUnderTest.configure(borderRadius: true)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_NatCard_with_elevation_and_border_Radius_hasValidSnapshot() {
        let systemUnderTest = NatCard()
        systemUnderTest.configure(elevation: true)
        systemUnderTest.configure(borderRadius: true)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    private func addConstraints(_ systemUnderTest: UIView) {

        systemUnderTest.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            systemUnderTest.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            systemUnderTest.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            systemUnderTest.heightAnchor.constraint(equalToConstant: 100),
            systemUnderTest.widthAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
