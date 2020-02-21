import FBSnapshotTestCase
@testable import NatDS

class TabItemViewTests: FBSnapshotTestCase {

    var sut: TabItemView!
    var delegateSpy: TabItemViewDelegateSpy!

    override func setUp() {
        super.setUp()

        delegateSpy = TabItemViewDelegateSpy()

        sut = TabItemView(title: "Tab")
        sut.delegate = delegateSpy
        sut.backgroundColor = .white
        sut.frame = CGRect(x: 0, y: 0, width: 120, height: 48)
    }

    func test_init_whenTitleIsNotUppercased_returnsTitleLabelTextUppercased() {
        sut = TabItemView(title: "not uppercased")
        XCTAssertEqual(sut.titleLabel.text, "NOT UPPERCASED")
    }

    func test_state_whenIsSelected_returnsSelectedSnapshot() {
        sut.setState(state: .selected)
        FBSnapshotVerifyView(sut)
    }

    func test_state_whenIsNormal_returnsNormalSnapshot() {
        sut.setState(state: .normal)
        FBSnapshotVerifyView(sut)
    }

    func test_handleTap_whenHasDelegate_returnsTappedItemAndCallDelagateOnce() {
        sut.handleTap()

        XCTAssertEqual(delegateSpy.selectedTabItem, sut)
        XCTAssertEqual(delegateSpy.callDidTapTabItemAt, 1)
    }
}
