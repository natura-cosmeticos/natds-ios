import UIKit

enum AssetsPath {
    case iconOutlinedActionCancel
    case iconOutlinedDefaultMockup
    case iconOutlinedNavigationArrowBottom
    case iconOutlinedNavigationArrowTop
    case iconOutlinedNavigationClose
}
extension AssetsPath: RawRepresentable {
    typealias RawValue = UIImage?

    init?(rawValue: RawValue) {
        switch rawValue {
        case AssetsHelper.image(from: "Icons/IconOutlinedActionCancel"):
            self = .iconOutlinedActionCancel
        case AssetsHelper.image(from: "Icons/IconOutlinedDefaultMockup"):
            self = .iconOutlinedDefaultMockup
        case AssetsHelper.image(from: "Icons/IconOutlinedNavigationArrowBottom"):
            self = .iconOutlinedNavigationArrowBottom
        case AssetsHelper.image(from: "Icons/IconOutlinedNavigationArrowTop"):
            self = .iconOutlinedNavigationArrowTop
        case AssetsHelper.image(from: "Icons/IconOutlinedNavigationClose"):
            self = .iconOutlinedNavigationClose
        default: return nil
        }
    }

    var rawValue: RawValue {
        switch self {
        case .iconOutlinedActionCancel:
            return AssetsHelper.image(from: "Icons/IconOutlinedActionCancel")
        case .iconOutlinedDefaultMockup:
            return AssetsHelper.image(from: "Icons/IconOutlinedDefaultMockup")
        case .iconOutlinedNavigationArrowBottom:
            return AssetsHelper.image(from: "Icons/IconOutlinedNavigationArrowBottom")
        case .iconOutlinedNavigationArrowTop:
            return AssetsHelper.image(from: "Icons/IconOutlinedNavigationArrowTop")
        case .iconOutlinedNavigationClose:
            return AssetsHelper.image(from: "Icons/IconOutlinedNavigationClose")
        }
    }
}
