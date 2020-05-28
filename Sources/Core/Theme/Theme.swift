import Foundation

protocol Theme {
    var colors: DynamicColors { get }
    var sizes: Sizes { get }
    var spacing: Space { get }
    var borderRadius: BorderRadius { get }
    var opacities: Opacities { get }
    var font: Font { get }
    var elevations: Elevations { get }
}
