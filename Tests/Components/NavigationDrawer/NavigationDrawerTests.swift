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
        delegateMock.numberOfSubitems = 0

        let section = 0
        sut.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: section))

        XCTAssertEqual(delegateMock.invokedDidSelectItem.count, 1)
        XCTAssertEqual(delegateMock.invokedDidSelectItem.parameters[0], section)
    }

    func test_didSelectRowAt_whenItIsAnCollapsedItem_callsDelegateNumberOfSubitems() {
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
        tableView.reloadData()
        sut.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: section))
        tableView.reloadData()

        let numberOfRows = sut.tableView(tableView, numberOfRowsInSection: section)

        XCTAssertEqual(numberOfRows, 1)
    }

}

class NavigationDrawerDelegateMock: NavigationDrawerDelegate {

    var numberOfSubitems = 2

    var invokedNumberOfItems = 0
    var invokedNumberOfSubitems: (count: Int, parameters: [Int])
    var invokedDidSelectItem: (count: Int, parameters: [Int])

    init() {
        invokedNumberOfSubitems = (0, [])
        invokedDidSelectItem = (0, [])
    }

    func numberOfItems() -> Int {
        invokedNumberOfItems += 1
        return 1
    }

    func numberOfSubitems(at item: Int) -> Int {
        invokedNumberOfSubitems.count += 1
        invokedNumberOfSubitems.parameters.append(item)
        return numberOfSubitems
    }

    func didSelectItem(_ item: Int) {
        invokedDidSelectItem.count += 1
        invokedDidSelectItem.parameters.append(item)
    }

}
