import XCTest
import SnapshotTesting

@testable import NatDS

final class NavigationDrawerItemCellTests: XCTestCase {
    var systemUnderTest: NavigationDrawerItemCell!

    override func setUp() {
        super.setUp()

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()

        systemUnderTest = NavigationDrawerItemCell()
        systemUnderTest.frame = CGRect(x: 0, y: 0, width: 320, height: 48)
        systemUnderTest.title = "Menu Item"
    }

    func test_largeText_textHasNoLineBreak() {
        systemUnderTest.title = "Menu Item lorem ipsum segum dolor et octum"

        assertSnapshot(matching: systemUnderTest, as: .image(precision: 0.99))
    }

    func test_normalStateWithoutSubItems_hasNormalSnapshotWithoutArrow() {
        systemUnderTest.state = .normal

        assertSnapshot(matching: systemUnderTest, as: .image(precision: 0.99))
    }

    func test_normalStateWithSubItems_hasNormalSnapshotWithArrow() {
        systemUnderTest.state = .normal
        systemUnderTest.hasSubItems = true

        assertSnapshot(matching: systemUnderTest, as: .image(precision: 0.99))
    }

    func test_disabledStateWithoutSubItems_hasDisabledSnapshotWithoutArrow() {
        let containerView = createContainerView(for: systemUnderTest)

        systemUnderTest.state = .disabled

        assertSnapshot(matching: containerView, as: .image(precision: 0.99))
    }

    func test_disabledStateWithSubItems_hasDisabledSnapshotWithArrow() {
        let containerView = createContainerView(for: systemUnderTest)

        systemUnderTest.state = .disabled
        systemUnderTest.hasSubItems = true

        assertSnapshot(matching: containerView, as: .image(precision: 0.99))
    }

    func test_selectedStateWithoutSubItems_hasSelectedSnapshotWithoutArrow() {
        systemUnderTest.state = .selected

        assertSnapshot(matching: systemUnderTest, as: .image(precision: 0.99))
    }

    func test_selectedStateWithSubItems_hasSelectedSnapshotWithArrow() {
        systemUnderTest.state = .selected
        systemUnderTest.hasSubItems = true

        assertSnapshot(matching: systemUnderTest, as: .image(precision: 0.99))
    }

    func test_setIcon_hasSnapshotWithCustomIcon() {
        systemUnderTest.icon = nil

        assertSnapshot(matching: systemUnderTest, as: .image(precision: 0.99))
    }

    func test_setTagText_hasSnapshotWithTag() {
        systemUnderTest.tagText = "New"

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_setTagText_withLargeTitle_hasSnapshotWithTag() {
        systemUnderTest.title = "Menu Item lorem ipsum segum dolor et octum"
        systemUnderTest.tagText = "New"

        assertSnapshot(matching: systemUnderTest, as: .image(precision: 0.99))
    }

    func test_setTagTextWithSubItems_hasSnapshotWithTag() {
        systemUnderTest.tagText = "New"
        systemUnderTest.hasSubItems = true

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_setTagTextWithSubItems_withLargeTitle_hasSnapshotWithTag() {
        systemUnderTest.title = "Menu Item lorem ipsum segum dolor et octum"
        systemUnderTest.tagText = "New"
        systemUnderTest.hasSubItems = true

        assertSnapshot(matching: systemUnderTest, as: .image(precision: 0.99))
    }

    func test_setTagTextWithSubItems_hasSelectedSnapshotWithTag() {
        systemUnderTest.tagText = "New"
        systemUnderTest.state = .selected
        systemUnderTest.hasSubItems = true

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_setTagTextWithSubItems_hasDisabledSnapshotWithTag() {
        systemUnderTest.tagText = "New"
        systemUnderTest.state = .disabled
        systemUnderTest.hasSubItems = true

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    private func createContainerView(for view: UIView) -> UIView {
        let containerView = UIView(frame: view.frame)
        containerView.addSubview(view)
        containerView.backgroundColor = .white
        return containerView
    }
}
