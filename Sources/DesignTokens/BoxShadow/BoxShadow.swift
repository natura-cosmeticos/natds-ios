class BoxShadow: NSObject {
    class func setBoxShadow02(_ layer: CALayer) {
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.14).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
    }
}
