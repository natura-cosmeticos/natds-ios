import XCTest
import SnapshotTesting

@testable import NatDS

final class ImageSnapshotTests: XCTestCase {
    var superview: UIView!

    override func setUp() {
        super.setUp()

        superview = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        superview.backgroundColor = .white

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()
    }

    func test_image_defaultImage_fallback_hasValidSnapshot() {
        let systemUnderTest = NatImage()
        systemUnderTest.configure(setImage: UIImage(named: "worngImage"))
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_image_added_hasValidSnapshot() {
        let systemUnderTest = NatImage()
        systemUnderTest.configure(setImage: AssetsPath.iconOutlinedDefaultMockupBackground.rawValue)
        systemUnderTest.configure(setBorderRadius: false)
        systemUnderTest.configure(setOverlay: false)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_image_added_with_borderRadius_hasValidSnapshot() {
        let systemUnderTest = NatImage()
        systemUnderTest.configure(setImage: AssetsPath.iconOutlinedDefaultMockupBackground.rawValue)
        systemUnderTest.configure(setBorderRadius: true)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_image_added_with_overlay_hasValidSnapshot() {
        let systemUnderTest = NatImage()
        systemUnderTest.configure(setImage: AssetsPath.iconOutlinedDefaultMockupBackground.rawValue)
        systemUnderTest.configure(setOverlay: true)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_image_added_with_borderRadius_and_overlay_hasValidSnapshot() {
        let systemUnderTest = NatImage()
        systemUnderTest.configure(setImage: AssetsPath.iconOutlinedDefaultMockupBackground.rawValue)
        systemUnderTest.configure(setBorderRadius: true)
        systemUnderTest.configure(setOverlay: true)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    private func addConstraints(_ systemUnderTest: UIView) {

        systemUnderTest.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            systemUnderTest.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            systemUnderTest.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            systemUnderTest.heightAnchor.constraint(equalToConstant: 50),
            systemUnderTest.widthAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
