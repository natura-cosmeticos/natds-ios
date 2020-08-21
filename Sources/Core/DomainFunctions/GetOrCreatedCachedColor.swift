func getOrCreatedCachedColor(
    colorHex: String,
    storage: ConfigurationStorage,
    fatalError: () -> Never) -> UIColor {

    if let color = storage.cachedColors[colorHex] {
        return color
    }

    guard let color = UIColor(hex: colorHex) else { fatalError() }

    storage.cachedColors[colorHex] = color

    return color
}
