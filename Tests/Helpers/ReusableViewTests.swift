import XCTest

class ReusableViewTests: XCTestCase {

    func test_reuseIdentifier_returnsClassName() {
        let reuseIdentifier = UITableViewCell.reuseIdentifier
        XCTAssertEqual(reuseIdentifier, "UITableViewCell")
    }

}
