import Foundation

protocol Theme {
    var lightColorPalette: ColorPalette { get }
    var darkColorPalette: ColorPalette { get }
    var sizes: Sizes { get }
    var spacing: Space { get }
    var borderRadius: BorderRadius { get }
    var opacities: Opacities { get }
    var font: Font { get }
    var elevations: Elevations { get }
}
