import XCTest
import SnapshotTesting

@testable import NatDS

final class NavigationDrawerTests: XCTestCase {
    var tableView: UITableView!
    var systemUnderTest: NavigationDrawer!
    var delegateMock: NavigationDrawerDelegateMock!

    override func setUp() {
        super.setUp()

        DesignSystem().configure(with: .natura)

        tableView = UITableView()
        delegateMock = NavigationDrawerDelegateMock()

        systemUnderTest = NavigationDrawer(tableView: tableView)
        systemUnderTest.delegate = delegateMock
        systemUnderTest.frame = CGRect(x: 0, y: 0, width: 320, height: 568)
    }

    func test_cellForRowAt_whenItIsAnItem_hasValidSnapshot() {
        delegateMock.mockNumberOfItems = 10
        delegateMock.mockNumberOfSubitems = 0

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_cellForRowAt_whenItIsACollapsedItem_hasValidSnapshot() {
        delegateMock.mockNumberOfItems = 10
        delegateMock.mockNumberOfSubitems = 2

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_cellForRowAt_whenItIsAnExpandedItem_hasValidSnapshot() {
        delegateMock.mockNumberOfItems = 10
        delegateMock.mockNumberOfSubitems = 2
        systemUnderTest.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        systemUnderTest.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 4))

        assertSnapshot(matching: systemUnderTest, as: .image)
    }
}
