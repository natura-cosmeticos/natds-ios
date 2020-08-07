import XCTest

@testable import NatDS

class TabItemViewTests: XCTestCase {
    var systemUnderTest: TabItemView!
    var delegateMock: TabItemViewDelegateMock!

    override func setUp() {
        super.setUp()

        delegateMock = TabItemViewDelegateMock()

        systemUnderTest = TabItemView(title: "Tab")
        systemUnderTest.delegate = delegateMock
        systemUnderTest.backgroundColor = .white
        systemUnderTest.frame = CGRect(x: 0, y: 0, width: 120, height: 48)
    }

    func test_init_whenTitleIsNotUppercased_returnsTitleLabelTextUppercased() {
        systemUnderTest = TabItemView(title: "not uppercased")
        XCTAssertEqual(systemUnderTest.titleLabel.text, "NOT UPPERCASED")
    }

    func test_handleTap_whenHasDelegate_returnsTappedItemAndCallDelagateOnce() {
        systemUnderTest.handleTap()

        XCTAssertEqual(delegateMock.invokedDidTapItem.count, 1)
        XCTAssertEqual(delegateMock.invokedDidTapItem.tabItem, systemUnderTest)
    }
}
