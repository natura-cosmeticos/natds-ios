import FBSnapshotTestCase
@testable import NatDS

class NavigationDrawerTests: FBSnapshotTestCase {

    var tableView: UITableView!
    var sut: NavigationDrawer!
    var delegateMock: NavigationDrawerDelegateMock!

    override func setUp() {
        super.setUp()
        tableView = UITableView()
        delegateMock = NavigationDrawerDelegateMock()

        sut = NavigationDrawer(tableView: tableView)
        sut.delegate = delegateMock
        sut.frame = CGRect(x: 0, y: 0, width: 320, height: 568)
    }

    func test_numberOfSections_callsDelegateNumberOfItems() {
        _ = sut.numberOfSections(in: tableView)

        XCTAssertEqual(delegateMock.invokedNumberOfItems, 1)
    }

    func test_numberRowsInSection_whenItemIsCollapsed_returnsOne() {
        let numberOfRows = sut.tableView(tableView, numberOfRowsInSection: 0)

        XCTAssertEqual(numberOfRows, 1)
    }

    func test_numberOfRowsInSection_whenItemIsExpanded_callsDelegateNumberOfSubitems() {
        let section = 0
        sut.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: section))

        _ = sut.tableView(tableView, numberOfRowsInSection: section)

        XCTAssertEqual(delegateMock.invokedNumberOfSubitems.count, 2)
        XCTAssertEqual(delegateMock.invokedNumberOfSubitems.parameters[0], section)
    }

    func test_numberOfRowsInSection_whenItemIsExpanded_returnsOnePlusNumberSubitems() {
        let numberOfSubItems = 2
        let expectedNumberOfRows = 1 + numberOfSubItems

        sut.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        let numberOfRows = sut.tableView(tableView, numberOfRowsInSection: 0)

        XCTAssertEqual(numberOfRows, expectedNumberOfRows)
    }

    func test_didSelectRowAt_whenItIsAnItemWithoutSubitem_callsDelegateDidSelectItem() {
        delegateMock.mockNumberOfSubitems = 0

        let section = 0
        sut.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: section))

        XCTAssertEqual(delegateMock.invokedDidSelectItem.count, 1)
        XCTAssertEqual(delegateMock.invokedDidSelectItem.parameters[0], section)
    }

    func test_didSelectRowAt_whenItIsADisabledItem_doesNotCallDelegateDidSelectItem() {
        delegateMock.mockDisabledItemState = true

        let section = 0
        sut.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: section))

        XCTAssertEqual(delegateMock.invokedDidSelectItem.count, 0)
    }

    func test_didSelectRowAt_whenItIsACollapsedItem_callsDelegateNumberOfSubitems() {
        let section = 0

        sut.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: section))
        tableView.reloadData()

        XCTAssertEqual(delegateMock.invokedNumberOfSubitems.count, 2)
        XCTAssertEqual(delegateMock.invokedNumberOfSubitems.parameters[0], section)
        XCTAssertEqual(delegateMock.invokedNumberOfSubitems.parameters[1], section)
    }

    func test_didSelectRowAt_whenItIsAnExpandedItem_numberOfRowsInSectionReturnsOne() {
        let section = 0
        sut.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: section))
        sut.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: section))

        let numberOfRows = sut.tableView(tableView, numberOfRowsInSection: section)

        XCTAssertEqual(numberOfRows, 1)
    }

    func test_didSelectRowAt_whenItIsASubitem_callsDelegateDidSelectSubitem() {
        let expectedItem = 0
        let expectedSubitem = 0

        let indexPath = IndexPath(row: 1, section: 0)
        sut.tableView(tableView, didSelectRowAt: indexPath)

        XCTAssertEqual(delegateMock.invokedDidSelectSubitem.count, 1)
        XCTAssertEqual(delegateMock.invokedDidSelectSubitem.parameters[0].item, expectedItem)
        XCTAssertEqual(delegateMock.invokedDidSelectSubitem.parameters[0].subitem, expectedSubitem)
    }

    func test_didSelectRowAt_whenItIsADisabledSubitem_doesNotCallDelegateDidSelectSubitem() {
        delegateMock.mockDisabledSubitemState = true

        sut.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        sut.layoutIfNeeded()
        sut.tableView(tableView, didSelectRowAt: IndexPath(row: 1, section: 0))

        XCTAssertEqual(delegateMock.invokedDidSelectSubitem.count, 0)
    }

    func test_cellForRowAt_whenItIsAnItem_callsDelegateViewForItem() {
        let section = 0

        _ = sut.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: section))

        XCTAssertEqual(delegateMock.invokedConfigureItem.count, 1)
        XCTAssertEqual(delegateMock.invokedConfigureItem.parameters[0].index, section)
    }

    func test_cellForRowAt_whenItIsASubitem_callsDelegateViewForSubitem() {
        let expectedItem = 0
        let expectedSubitem = 0

        let indexPath = IndexPath(row: 1, section: 0)
        _ = sut.tableView(tableView, cellForRowAt: indexPath)

        XCTAssertEqual(delegateMock.invokedConfigureSubitem.count, 1)
        XCTAssertEqual(delegateMock.invokedConfigureSubitem.parameters[0].index.item, expectedItem)
        XCTAssertEqual(delegateMock.invokedConfigureSubitem.parameters[0].index.subitem, expectedSubitem)
    }

    func test_cellForRowAt_whenItIsASubitem_cellStateIsNormalByDefault() {
        let indexPath = IndexPath(row: 1, section: 0)

        let cell = sut.tableView(tableView, cellForRowAt: indexPath) as? NavigationDrawerSubitemCell

        XCTAssertEqual(cell?.state, .normal)
    }

    func test_cellForRowAt_whenItIsAnItem_hasValidSnapshot() {
        delegateMock.mockNumberOfItems = 10
        delegateMock.mockNumberOfSubitems = 0

        FBSnapshotVerifyView(sut)
    }

    func test_cellForRowAt_whenItIsACollapsedItem_hasValidSnapshot() {
        delegateMock.mockNumberOfItems = 10
        delegateMock.mockNumberOfSubitems = 2

        FBSnapshotVerifyView(sut)
    }

    func test_cellForRowAt_whenItIsAnExpandedItem_hasValidSnapshot() {
        delegateMock.mockNumberOfItems = 10
        delegateMock.mockNumberOfSubitems = 2
        sut.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        sut.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 4))

        FBSnapshotVerifyView(sut)
    }

}
