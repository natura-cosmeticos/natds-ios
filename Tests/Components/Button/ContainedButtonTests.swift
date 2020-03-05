import FBSnapshotTestCase
@testable import NatDS

class ContainedButtonTests: FBSnapshotTestCase {

    var sut: ContainedButton!
    var superview: UIView!

    override func setUp() {
        super.setUp()

        sut = ContainedButton(frame: CGRect(x: 8, y: 58, width: 144, height: 44))
        sut.setTitle("Default", for: .normal)
        sut.setTitle("Disabled", for: .disabled)

        superview = UIView(frame: CGRect(x: 0, y: 0, width: 160, height: 160))
        superview.backgroundColor = .white
        superview.addSubview(sut)
    }

    func test_init_hasValidSnapshot() {
        FBSnapshotVerifyView(superview)
    }

    func test_isEnable_whenIsFalse_hasDisableSnapshot() {
        sut.isEnabled = false
        FBSnapshotVerifyView(superview)
    }

    func test_setTitle_hasUppercasedTitle() {
        sut.setTitle("ok", for: .normal)
        XCTAssertEqual(sut.titleLabel?.text, "OK")
    }
}
