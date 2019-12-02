class AssetsHelper {
    static func image(from name: String) -> UIImage? {
        let bundle = Bundle(for: self)
        return UIImage(named: name, in: bundle, compatibleWith: nil)
    }
}
