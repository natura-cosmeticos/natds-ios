import FBSnapshotTestCase
@testable import NatDS

class TextFieldTests: FBSnapshotTestCase {

    var sut: TextField!

    override func setUp() {
        super.setUp()

        sut = TextField(frame: CGRect(x: 0, y: 0, width: 328, height: 99))
        sut.backgroundColor = .white

        sut.info = "Label"
        sut.placeholder = "Placeholder"
        sut.helper = "Helper Text"

        //recordMode = true
    }

    func test_enableState_hasEnableSnapshot() {
        sut.state = .enable
        FBSnapshotVerifyView(sut)
    }

    func test_activeState_hasActiveSnapshot() {
        sut.state = .active
        FBSnapshotVerifyView(sut)
    }

    func test_errorState_hasErrorSnapshot() {
        sut.state = .error("Error: Has an error")
        FBSnapshotVerifyView(sut)
    }
}
