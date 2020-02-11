import FBSnapshotTestCase
@testable import NatDS

class DividerTests: FBSnapshotTestCase {

    var sut: Divider!
    var superview: UIView!

    override func setUp() {
        super.setUp()

        superview = UIView(frame: CGRect(x: 0, y: 0, width: 160, height: 160))
        sut = Divider(frame: CGRect(x: 0, y: superview.frame.size.height/2, width: 160, height: 0))

        superview.backgroundColor = .white
        superview.addSubview(sut)
    }

    func test_init_hasValidSnapshot() {
        FBSnapshotVerifyView(superview)
    }
}
