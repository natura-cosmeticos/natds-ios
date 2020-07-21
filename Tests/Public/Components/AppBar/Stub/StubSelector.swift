@testable import NatDS

class StubSelector: NSObject {
    var handlerWasCalled = false

    @objc func handler() {
        handlerWasCalled = true
    }
}
