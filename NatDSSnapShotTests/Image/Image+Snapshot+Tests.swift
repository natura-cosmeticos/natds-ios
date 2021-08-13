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

    func test_image_standard_hasValidSnapshot() {
        let systemUnderTest = NatImage()
        systemUnderTest.configure(setImage: AssetsPath.iconOutlinedDefaultMockupBackground.rawValue)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_image_highlight_hasValidSnapshot() {
        let systemUnderTest = NatImage()
        systemUnderTest.configure(variant: .highlight)
        systemUnderTest.configure(setImage: AssetsPath.iconOutlinedDefaultMockupBackground.rawValue)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }
    func test_image_radius_none_hasValidSnapshot() {
        let systemUnderTest = NatImage()
        systemUnderTest.configureRadius(.none)
        systemUnderTest.configure(setImage: AssetsPath.iconOutlinedDefaultMockupBackground.rawValue)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }
    func test_image_radius_medium_hasValidSnapshot() {
        let systemUnderTest = NatImage()
        systemUnderTest.configureRadius(.medium)
        systemUnderTest.configure(setImage: AssetsPath.iconOutlinedDefaultMockupBackground.rawValue)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }
    func test_image_radius_circle_hasValidSnapshot() {
        let systemUnderTest = NatImage()
        systemUnderTest.configureRadius(.circle(imageHeight: 50))
        systemUnderTest.configure(setImage: AssetsPath.iconOutlinedDefaultMockupBackground.rawValue)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }
    func test_image_fade_top_hasValidSnapshot() {
        let systemUnderTest = NatImage()
        systemUnderTest.configureFade(.top)
        systemUnderTest.configure(setImage: AssetsPath.iconOutlinedDefaultMockupBackground.rawValue)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }
    func test_image_fade_bottom_hasValidSnapshot() {
        let systemUnderTest = NatImage()
        systemUnderTest.configureFade(.bottom)
        systemUnderTest.configure(setImage: AssetsPath.iconOutlinedDefaultMockupBackground.rawValue)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }
    func test_image_fade_right_hasValidSnapshot() {
        let systemUnderTest = NatImage()
        systemUnderTest.configureFade(.right)
        systemUnderTest.configure(setImage: AssetsPath.iconOutlinedDefaultMockupBackground.rawValue)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }
    func test_image_fade_left_hasValidSnapshot() {
        let systemUnderTest = NatImage()
        systemUnderTest.configureFade(.left)
        systemUnderTest.configure(setImage: AssetsPath.iconOutlinedDefaultMockupBackground.rawValue)
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
