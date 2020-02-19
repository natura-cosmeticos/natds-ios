import FBSnapshotTestCase
@testable import NatDS

class TabViewTests: FBSnapshotTestCase {

    var sut: TabItemView!
    var delegateSpy: TabItemViewDelegateSpy!

    override func setUp() {
        super.setUp()

        delegateSpy = TabItemViewDelegateSpy()

        sut = TabItemView(index: 0, title: "Tab")
        sut.delegate = delegateSpy
        sut.backgroundColor = .white
        sut.frame = CGRect(x: 0, y: 0, width: 120, height: 48)
    }

    func test_init_whenTitleIsNotUppercased_returnsTitleLabelTextUppercased() {
        sut = TabItemView(index: 0, title: "not uppercased")
        XCTAssertEqual(sut.titleLabel.text, "NOT UPPERCASED")
    }

    func test_state_whenIsActive_returnsActiveSnapshot() {
        sut.changeStateBySelectedIndex(0)
        FBSnapshotVerifyView(sut)
    }

    func test_state_whenIsNormal_returnsNormalSnapshot() {
        sut.changeStateBySelectedIndex(1)
        FBSnapshotVerifyView(sut)
    }

    func test_handleTap_whenHasDelegate_returnsTappedIndexAndCallDelagateOnce() {
        let expectIndex = 0

        sut.handleTap()

        XCTAssertEqual(delegateSpy.selectedIndex, expectIndex)
        XCTAssertEqual(delegateSpy.callDidTapTabItemAt, 1)
    }
}
