import Foundation

protocol Theme {
    var lightColorPalette: ColorPalette { get }
    var darkColorPalette: ColorPalette { get }
    var size: Size { get }
    var spacing: Space { get }
}
