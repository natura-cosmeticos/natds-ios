import FBSnapshotTestCase
@testable import NatDS

class ValueTextHighlightTests: FBSnapshotTestCase {

    var sut: ValueTextHighlight!
    var superview: UIView!

    override func setUp() {
        super.setUp()
        sut = ValueTextHighlight(frame: CGRect(x: 0, y: 10, width: 328, height: 80))
        superview = UIView(frame: CGRect(x: 0, y: 0, width: 328, height: 100))
        superview.backgroundColor = .white
        superview.addSubview(sut)
    }

    func test_init_hasValidSnapshot() {
        sut.valueDescription = "Você está transferindo"
        sut.value = "R$ 43,00"
        FBSnapshotVerifyView(superview)
    }
}
