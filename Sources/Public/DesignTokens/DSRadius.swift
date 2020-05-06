public enum DSBorderRadius {
    public static var small: CGFloat { getTheme().borderRadius.small }
    public static var medium: CGFloat { getTheme().borderRadius.medium }
    public static var large: CGFloat { getTheme().borderRadius.large }
    public static func circle(viewHeight: CGFloat) -> CGFloat {
        getTheme().borderRadius.cicle(viewHeight: viewHeight)
    }
}
