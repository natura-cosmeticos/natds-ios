protocol TextStyles {
    typealias Style = (size: CGFloat, defaultWeight: UIFont.Weight)
    var heading1: Style { get }
    var heading2: Style { get }
    var heading3: Style { get }
    var heading4: Style { get }
    var heading5: Style { get }
    var heading6: Style { get }
    var subtitle1: Style { get }
    var subtitle2: Style { get }
    var body1: Style { get }
    var body2: Style { get }
    var button: Style { get }
    var caption: Style { get }
    var overline: Style { get }
}
