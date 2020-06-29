import XCTest

class UITableViewReusableTests: XCTestCase {

    func test_dequeueReusableCell_whenItRegistersValidIdentifier_returnsNonNullCell() {
        let sut = UITableView()
        sut.dataSource = self
        sut.register(UITableViewCell.self)

        let cell = sut.dequeueReusableCell(for: IndexPath(row: 0, section: 0))

        XCTAssertNotNil(cell)
    }

}

extension UITableViewReusableTests: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
