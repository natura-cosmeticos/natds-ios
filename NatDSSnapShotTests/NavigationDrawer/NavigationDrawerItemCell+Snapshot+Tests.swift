import XCTest
import SnapshotTesting

@testable import NatDS

final class NavigationDrawerItemCellTests: XCTestCase {
    var systemUnderTest: NavigationDrawerItemCell!

    override func setUp() {
        super.setUp()

        DesignSystem().configure(with: .natura)

        systemUnderTest = NavigationDrawerItemCell()
        systemUnderTest.frame = CGRect(x: 0, y: 0, width: 320, height: 48)
        systemUnderTest.title = "Menu Item"
    }

    func test_largeText_textHasNoLineBreak() {
        systemUnderTest.title = "Menu Item lorem ipsum segum dolor et octum"

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_normalStateWithoutSubItems_hasNormalSnapshotWithoutArrow() {
        systemUnderTest.state = .normal

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_normalStateWithSubItems_hasNormalSnapshotWithArrow() {
        systemUnderTest.state = .normal
        systemUnderTest.hasSubItems = true

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_disabledStateWithoutSubItems_hasDisabledSnapshotWithoutArrow() {
        let containerView = createContainerView(for: systemUnderTest)

        systemUnderTest.state = .disabled

        assertSnapshot(matching: containerView, as: .image)
    }

    func test_disabledStateWithSubItems_hasDisabledSnapshotWithArrow() {
        let containerView = createContainerView(for: systemUnderTest)

        systemUnderTest.state = .disabled
        systemUnderTest.hasSubItems = true

        assertSnapshot(matching: containerView, as: .image)
    }

    func test_selectedStateWithoutSubItems_hasSelectedSnapshotWithoutArrow() {
        systemUnderTest.state = .selected

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_selectedStateWithSubItems_hasSelectedSnapshotWithArrow() {
        systemUnderTest.state = .selected
        systemUnderTest.hasSubItems = true

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_setIcon_hasSnapshotWithCustomIcon() {
        systemUnderTest.icon = .filledActionAdd

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    private func createContainerView(for view: UIView) -> UIView {
        let containerView = UIView(frame: view.frame)
        containerView.addSubview(view)
        containerView.backgroundColor = .white
        return containerView
    }
}
