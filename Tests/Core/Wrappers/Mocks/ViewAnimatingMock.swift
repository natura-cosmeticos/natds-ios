@testable import NatDS

struct ViewAnimatingMock: ViewAnimating {

    func animate(withDuration duration: TimeInterval, animations: @escaping () -> Void) {
        animations()
    }

    func animate(withDuration duration: TimeInterval, animations: @escaping () -> Void, completion: ((Bool) -> Void)?) {
        animations()
        let finished = true
        completion?(finished)
    }

}
