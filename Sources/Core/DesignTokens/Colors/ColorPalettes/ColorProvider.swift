protocol ColorProvider {
    func createDynamicColor(for keyPath: KeyPath<ColorPalette, String>) -> UIColor
}
