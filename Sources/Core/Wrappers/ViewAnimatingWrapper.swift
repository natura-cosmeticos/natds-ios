protocol ViewAnimating {
    func animate(withDuration duration: TimeInterval, animations: @escaping () -> Void)

    func animate(withDuration duration: TimeInterval, animations: @escaping () -> Void, completion: ((Bool) -> Void)?)

    func animate(withDuration duration: TimeInterval,
                 delay: TimeInterval,
                 options: UIView.AnimationOptions,
                 animations: @escaping () -> Void)

    func animate(withDuration duration: TimeInterval,
                 delay: TimeInterval,
                 options: UIView.AnimationOptions,
                 animations: @escaping () -> Void,
                 completion: ((Bool) -> Void)?)
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

    func animate(withDuration duration: TimeInterval,
                 delay: TimeInterval,
                 options: UIView.AnimationOptions = [],
                 animations: @escaping () -> Void) {
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: options,
                       animations: animations)
    }

    func animate(withDuration duration: TimeInterval,
                 delay: TimeInterval,
                 options: UIView.AnimationOptions,
                 animations: @escaping () -> Void,
                 completion: ((Bool) -> Void)?) {
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: options,
                       animations: animations,
                       completion: completion)
    }

}
