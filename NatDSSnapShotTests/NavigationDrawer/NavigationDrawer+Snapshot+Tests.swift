import XCTest
import SnapshotTesting

@testable import NatDS

final class NavigationDrawerTests: XCTestCase {
    var tableView: UITableView!
    var systemUnderTest: NavigationDrawer!
    var delegateMock: NavigationDrawerDelegateMock!

    override func setUp() {
        super.setUp()

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()

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

        assertSnapshot(matching: systemUnderTest, as: .image(precision: 0.99))
    }

    func test_cellForRowAt_whenItIsAnExpandedItem_hasValidSnapshot() {
        delegateMock.mockNumberOfItems = 10
        delegateMock.mockNumberOfSubitems = 2
        tableView.reloadData()
        systemUnderTest.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        systemUnderTest.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 4))

        assertSnapshot(matching: systemUnderTest, as: .image(precision: 0.99))
    }

    func test_componentWithHeaderView_hasValidSnapshot() {
        let header = genericViewWithLogo()

        systemUnderTest = NavigationDrawer(tableView: tableView, headerView: header)
        systemUnderTest.delegate = delegateMock
        systemUnderTest.frame = CGRect(x: 0, y: 0, width: 320, height: 568)

        assertSnapshot(matching: systemUnderTest, as: .image(precision: 0.99))
    }

    func test_componentWithFooterView_hasValidSnapshot() {
        let footer = genericViewWithLogo()

        systemUnderTest = NavigationDrawer(tableView: tableView, footerView: footer)
        systemUnderTest.delegate = delegateMock
        delegateMock.mockNumberOfItems = 10
        systemUnderTest.frame = CGRect(x: 0, y: 0, width: 320, height: 568)

        assertSnapshot(matching: systemUnderTest, as: .image(precision: 0.99))
    }

    func genericViewWithLogo() -> UIView {
        let view = UIView()
        view.height = 100
        let logo = NatLogo(size: .huge)
        view.addSubview(logo)
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        return view
    }
}
