import Foundation

protocol Theme {
    var lightColorPalette: ColorPalette { get }
    var darkColorPalette: ColorPalette { get }
    var sizes: Sizes { get }
    var spacing: Space { get }
}
