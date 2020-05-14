struct ViewStyling {
    func applyElevation(onView view: UIView, with attributtes: ElevationAttributes) {
        view.layer.shadowColor = attributtes.shadowColor
        view.layer.shadowOffset = attributtes.shadowOffSet
        view.layer.shadowRadius = attributtes.shadowRadius
        view.layer.shadowOpacity = attributtes.shadowOpacity
        view.layer.masksToBounds = false
    }
}
