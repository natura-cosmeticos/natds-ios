import FBSnapshotTestCase
@testable import NatDS

class ValueTextHighlightTests: FBSnapshotTestCase {

    var sut: ValueTextHighlight!
    var superview: UIView!

    override func setUp() {
        super.setUp()
        superview = UIView(frame: CGRect(x: 0, y: 0, width: 328, height: 100))
        superview.backgroundColor = .white
        sut = ValueTextHighlight(frame: CGRect(x: 0, y: 10, width: 328, height: 80))
        sut.backgroundColor = .white
        sut.valueDescription = "Você está transferindo"
        sut.value = "R$ 43,00"
        superview.addSubview(sut)
    }

    func test_init_hasValidSnapshot() {
        FBSnapshotVerifyView(superview)
    }
}
