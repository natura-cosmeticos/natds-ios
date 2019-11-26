import FBSnapshotTestCase
@testable import NatDS

class NavigationDrawerSubmenuItemTests: FBSnapshotTestCase {

    var sut: NavigationDrawerSubmenuItem!

    override func setUp() {
        super.setUp()
        sut = NavigationDrawerSubmenuItem()
        sut.frame = CGRect(x: 0, y: 0, width: 320, height: 64)
    }

    func test_normalState_hasNormalSnapshot() {
        sut.text = "Sub Menu Item (Normal)"
        FBSnapshotVerifyView(sut)
    }

    func test_selectedState_hasSnapshotWithHighlightedView() {
        sut.text = "Sub Menu Item (Selected)"
        sut.state = .selected
        FBSnapshotVerifyView(sut)
    }

    func test_disabledState_hasSnapshotWithAlphaText() {
        sut.text = "Sub Menu Item (Disabled)"
        sut.state = .disabled
        FBSnapshotVerifyView(sut)
    }

}
