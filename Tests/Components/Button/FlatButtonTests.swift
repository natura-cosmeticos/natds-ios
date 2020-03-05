import FBSnapshotTestCase
@testable import NatDS

class FlatButtonTests: FBSnapshotTestCase {

    var sut: FlatButton!
    var superview: UIView!

    override func setUp() {
        super.setUp()

        sut = FlatButton(frame: CGRect(x: 8, y: 58, width: 144, height: 48))
        sut.setTitle("Button", for: .normal)

        superview = UIView(frame: CGRect(x: 0, y: 0, width: 160, height: 160))
        superview.backgroundColor = .white
        superview.addSubview(sut)
    }

    func test_setTitle_hasUppercasedTitle() {
        sut.setTitle("ok", for: .normal)
        XCTAssertEqual(sut.titleLabel?.text, "OK")
    }

    func test_int_hasValidSnapshot() {
        FBSnapshotVerifyView(superview)
    }

    func test_isEnable_whenIsFalse_hasDisableSnapshot() {
        sut.isEnabled = false
        FBSnapshotVerifyView(superview)
    }
}
