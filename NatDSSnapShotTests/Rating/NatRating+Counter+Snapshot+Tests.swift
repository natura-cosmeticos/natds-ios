import XCTest
import SnapshotTesting

@testable import NatDS

final class NatRatingCounterSnapshotTests: XCTestCase {
    var systemUnderTest: NatRating!
    var superview: UIView!

    override func setUp() {
        super.setUp()

        superview = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()

        systemUnderTest = NatRating(style: .counter)
        systemUnderTest.configure(text: "Rating label")
    }

    func test_rating_counter_hasValidSnapshot() {
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_rating_counter_sizeSemiX_hasValidSnapshot() {
        systemUnderTest = NatRating(style: .counter, size: .semiX)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_rating_counter_sizeSmall_hasValidSnapshot() {
        systemUnderTest = NatRating(style: .counter, size: .small)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_rating_counter_sizeStandard_hasValidSnapshot() {
        systemUnderTest = NatRating(style: .counter, size: .standard)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_rating_counter_right_hasValidSnapshot() {
        systemUnderTest = NatRating(style: .counter, alignment: .right)
        systemUnderTest.configure(text: "Rating label")
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: systemUnderTest, as: .image)
    }
}

extension NatRatingCounterSnapshotTests {
    private func addConstraints(_ systemUnderTest: UIView) {
        systemUnderTest.translatesAutoresizingMaskIntoConstraints = false

        systemUnderTest.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        systemUnderTest.centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
    }
}
