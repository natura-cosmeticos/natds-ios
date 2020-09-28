enum ViewStyle {
    static func applyElevation(on view: UIView, with attributes: NatElevation.ElevationAttributes) {
        view.layer.shadowColor = attributes.shadowColor
        view.layer.shadowOffset = attributes.shadowOffSet
        view.layer.shadowRadius = attributes.shadowRadius
        view.layer.shadowOpacity = attributes.shadowOpacity
        view.layer.masksToBounds = false
    }
}
