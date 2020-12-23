extension UIImageView {
    var tintedColor: UIColor {
        get {
            return tintColor
        }
        set {
            image = image?.withRenderingMode(.alwaysTemplate)
            tintColor = newValue
        }
    }
}
