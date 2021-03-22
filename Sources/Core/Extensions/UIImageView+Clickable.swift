// swiftlint:disable force_cast
public typealias SimpleClosure = (() -> Void)
private var tappableKey: UInt8 = 0
private var actionKey: UInt8 = 1

extension UIImageView {

    @objc var callback: SimpleClosure {
        get {
            return (objc_getAssociatedObject(self, &actionKey) as? SimpleClosure)!
        }
        set {
            objc_setAssociatedObject(self, &actionKey,
                                     newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    var gesture: UITapGestureRecognizer {
        return UITapGestureRecognizer(target: self, action: #selector(tapped))
    }

    var isClickable: Bool! {
        get {
            return objc_getAssociatedObject(self, &tappableKey) as? Bool
        }
        set(newValue) {
            objc_setAssociatedObject(self, &tappableKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            self.addTapGesture()
        }
    }

    fileprivate func addTapGesture() {
        if isClickable {
            self.gesture.numberOfTapsRequired = 1
            self.isUserInteractionEnabled = true
            self.addGestureRecognizer(gesture)
        }
    }

    @objc private func tapped() {
        callback()
    }
}
