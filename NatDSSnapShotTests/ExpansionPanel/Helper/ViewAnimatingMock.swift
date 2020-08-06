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

    func animate(withDuration duration: TimeInterval,
                 delay: TimeInterval,
                 options: UIView.AnimationOptions,
                 animations: @escaping () -> Void) {
        animations()
    }

    func animate(withDuration duration: TimeInterval,
                 delay: TimeInterval,
                 options: UIView.AnimationOptions,
                 animations: @escaping () -> Void,
                 completion: ((Bool) -> Void)?) {
        animations()
        let finished = true
        completion?(finished)
    }
}
