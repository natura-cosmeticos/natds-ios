@testable import NatDS

extension ElevationAttributes: Equatable {
    public static func == (lhs: ElevationAttributes, rhs: ElevationAttributes) -> Bool {
        lhs.shadowColor == rhs.shadowColor &&
        lhs.shadowOffSet == rhs.shadowOffSet &&
        lhs.shadowRadius == rhs.shadowRadius &&
        lhs.shadowOpacity == rhs.shadowOpacity
    }
}
