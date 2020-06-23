protocol ViewAnimating {
    func animate(withDuration duration: TimeInterval, animations: @escaping () -> Void)

    func animate(withDuration duration: TimeInterval, animations: @escaping () -> Void, completion: ((Bool) -> Void)?)
}

struct ViewAnimatingWrapper: ViewAnimating {

    func animate(withDuration duration: TimeInterval, animations: @escaping () -> Void) {
        UIView.animate(withDuration: duration,
                       animations: animations)
    }

    func animate(withDuration duration: TimeInterval, animations: @escaping () -> Void, completion: ((Bool) -> Void)?) {
        UIView.animate(withDuration: duration,
                       animations: animations,
                       completion: completion)
    }

}
