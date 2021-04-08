import XCTest
import SnapshotTesting

@testable import NatDS

final class NatRatingInputSnapshotTests: XCTestCase {
    var systemUnderTest: NatRating!
    var superview: UIView!

    override func setUp() {
        super.setUp()

        superview = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()

        systemUnderTest = NatRating(style: .input)
    }

    func test_rating_input_hasValidSnapshot() {
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_rating_input_sizeSemiX_hasValidSnapshot() {
        systemUnderTest = NatRating(style: .input, size: .semiX)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_rating_input_sizeMedium_hasValidSnapshot() {
        systemUnderTest = NatRating(style: .input, size: .medium)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_rating_input_withHint_hasValidSnapshot() {
        systemUnderTest.configure(text: "Rating label")
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_rating_input_filled_hasValidSnapshot() {
        systemUnderTest.configure(rate: 5)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_rating_input_filled_Disabled_hasValidSnapshot() {
        systemUnderTest.configure(rate: 4)
        systemUnderTest.configure(state: .disabled)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: systemUnderTest, as: .image)
    }
}

extension NatRatingInputSnapshotTests {
    private func addConstraints(_ systemUnderTest: UIView) {
        systemUnderTest.translatesAutoresizingMaskIntoConstraints = false

        systemUnderTest.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        systemUnderTest.centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
    }
}
