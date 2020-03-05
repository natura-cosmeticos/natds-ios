import FBSnapshotTestCase
@testable import NatDS

class ButtonTests: FBSnapshotTestCase {

    var sut: Button!

    override func setUp() {
        super.setUp()

        sut = Button(frame: CGRect(x: 0, y: 0, width: 144, height: 48))
        sut.backgroundColor = .white
        sut.setTitle("Button", for: .normal)
        sut.setTitleColor(Colors.Content.highEmphasis, for: .normal)
    }

    func test_setTitle_hasUppercasedTitle() {
        sut.setTitle("ok", for: .normal)

        XCTAssertEqual(sut.titleLabel?.text, "OK")
    }

    func test_init_hasValidSnapshot() {
        FBSnapshotVerifyView(sut)
    }

    func test_pulseAnimation_whenBeginPulseAt_hasPulseActiveSnapshot() {
        sut.beginPulseAt(point: sut.center)
        FBSnapshotVerifyView(sut)
    }
}
