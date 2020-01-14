import FBSnapshotTestCase
@testable import NatDS

class NavigationDrawerItemCellTests: FBSnapshotTestCase {

    var sut: NavigationDrawerItemCell!

    override func setUp() {
        super.setUp()
        sut = NavigationDrawerItemCell()
        sut.frame = CGRect(x: 0, y: 0, width: 320, height: 48)
        sut.title = "Menu Item"
        sut.icon = .outlinedNavigationArrowleft
    }

    func test_largeText_textHasNoLineBreak() {
        sut.title = "Menu Item lorem ipsum segum dolor et octum"

        FBSnapshotVerifyView(sut)
    }

    func test_normalStateWithoutSubItems_hasNormalSnapshotWithoutArrow() {
        sut.state = .normal

        FBSnapshotVerifyView(sut)
    }

    func test_normalStateWithSubItems_hasNormalSnapshotWithArrow() {
        sut.state = .normal
        sut.hasSubItems = true

        FBSnapshotVerifyView(sut)
    }

    func test_disabledStateWithoutSubItems_hasDisabledSnapshotWithoutArrow() {
        let containerView = createContainerView(for: sut)

        sut.state = .disabled

        FBSnapshotVerifyView(containerView)
    }

    func test_disabledStateWithSubItems_hasDisabledSnapshotWithArrow() {
        let containerView = createContainerView(for: sut)

        sut.state = .disabled
        sut.hasSubItems = true

        FBSnapshotVerifyView(containerView)
    }

    func test_selectedStateWithoutSubItems_hasSelectedSnapshotWithoutArrow() {
        sut.state = .selected

        FBSnapshotVerifyView(sut)
    }

    func test_selectedStateWithSubItems_hasSelectedSnapshotWithArrow() {
        sut.state = .selected
        sut.hasSubItems = true

        FBSnapshotVerifyView(sut)
    }

    func test_init_hasSelectionStyleAsNone() {
        XCTAssertEqual(sut.selectionStyle, .none)
    }

    private func createContainerView(for view: UIView) -> UIView {
        let containerView = UIView(frame: view.frame)
        containerView.addSubview(view)
        containerView.backgroundColor = .white
        return containerView
    }

}
