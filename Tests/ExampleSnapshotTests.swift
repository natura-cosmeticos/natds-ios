import FBSnapshotTestCase

class ExampleSnapshotTests: FBSnapshotTestCase {
    func testExample() {
        let sut = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        sut.backgroundColor = UIColor.blue
        FBSnapshotVerifyView(sut)
    }
}
