import Foundation

protocol Theme {
    var colors: DynamicColors { get }
    var font: Font { get }
    var elevations: Elevations { get }
}
