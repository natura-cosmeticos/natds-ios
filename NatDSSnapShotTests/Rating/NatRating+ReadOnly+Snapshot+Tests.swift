import XCTest
import SnapshotTesting

@testable import NatDS

final class NatRatingReadOnlySnapshotTests: XCTestCase {
    var systemUnderTest: NatRating!
    var superview: UIView!

    override func setUp() {
        super.setUp()

        superview = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()

        systemUnderTest = NatRating(style: .readOnly)
    }

    func test_rating_readOnly_hasValidSnapshot() {
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_rating_readOnly_sizeSemiX_hasValidSnapshot() {
        systemUnderTest = NatRating(style: .readOnly, size: .semiX)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_rating_readOnly_sizeSmall_hasValidSnapshot() {
        systemUnderTest = NatRating(style: .readOnly, size: .small)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_rating_readOnly_sizeStandard_hasValidSnapshot() {
        systemUnderTest = NatRating(style: .readOnly, size: .standard)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_rating_readOnly_filled_hasValidSnapshot() {
        systemUnderTest = NatRating(style: .readOnly, alignment: .right)
        systemUnderTest.configure(rate: 3)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: systemUnderTest, as: .image)
    }
}

extension NatRatingReadOnlySnapshotTests {
    private func addConstraints(_ systemUnderTest: UIView) {
        systemUnderTest.translatesAutoresizingMaskIntoConstraints = false

        systemUnderTest.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        systemUnderTest.centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
    }
}
