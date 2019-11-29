import FBSnapshotTestCase
@testable import NatDS

class NavigationDrawerSubmenuItemTests: FBSnapshotTestCase {
    var sut: NavigationDrawerSubmenuItem!

    override func setUp() {
        super.setUp()
        sut = NavigationDrawerSubmenuItem()
        sut.frame = CGRect(x: 0, y: 0, width: 320, height: 48)
        sut.text = "Sub Menu Item"
    }

    func test_normalState_hasNormalSnapshot() {
        sut.state = .normal
        FBSnapshotVerifyView(sut)
    }

    func test_selectedState_hasSnapshotWithHighlightedView() {
        sut.state = .selected
        FBSnapshotVerifyView(sut)
    }

    func test_disabledState_hasSnapshotWithAlphaText() {
        sut.state = .disabled
        FBSnapshotVerifyView(sut)
    }
}
