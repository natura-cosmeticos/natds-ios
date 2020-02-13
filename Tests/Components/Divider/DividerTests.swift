import FBSnapshotTestCase
@testable import NatDS

class DividerTests: FBSnapshotTestCase {

    var sut: Divider!
    var superview: UIView!

    override func setUp() {
        super.setUp()

        sut = Divider()

        superview = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 3))
        superview.backgroundColor = .white
        superview.addSubview(sut)

        let contraints = [
            sut.topAnchor.constraint(equalTo: self.superview.topAnchor, constant: 1),
            sut.leadingAnchor.constraint(equalTo: self.superview.leadingAnchor),
            sut.trailingAnchor.constraint(equalTo: self.superview.trailingAnchor)
        ]

        NSLayoutConstraint.activate(contraints)
    }

    func test_init_hasValidSnapshot() {
        FBSnapshotVerifyView(superview)
    }
}
