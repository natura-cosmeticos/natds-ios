@testable import NatDS

extension NatElevation.ElevationAttributes: Equatable {
    public static func == (lhs: NatElevation.ElevationAttributes, rhs: NatElevation.ElevationAttributes) -> Bool {
        lhs.shadowColor == rhs.shadowColor &&
        lhs.shadowOffSet == rhs.shadowOffSet &&
        lhs.shadowRadius == rhs.shadowRadius &&
        lhs.shadowOpacity == rhs.shadowOpacity
    }
}
