import UIKit

enum AssetsPath {
    case iconOutlinedActionCancel
    case iconOutlinedActionVisibility
    case iconOutlinedActionVisibilityOff
    case iconOutlinedDefaultMockup
    case iconOutlinedDefaultMockupBackground
    case iconOutlinedNavigationArrowBottom
    case iconOutlinedNavigationArrowTop
    case iconOutlinedProductEmptyBackground
    case iconOutlinedSocialPerson
}

extension AssetsPath: RawRepresentable {
    typealias RawValue = UIImage?

    init?(rawValue: RawValue) {
        switch rawValue {
        case AssetsHelper.image(from: "Icons/IconOutlinedActionCancel"):
            self = .iconOutlinedActionCancel
        case AssetsHelper.image(from: "Icons/IconOutlinedActionVisibility"):
            self = .iconOutlinedActionVisibility
        case AssetsHelper.image(from: "Icons/IconOutlinedActionVisibilityOff"):
            self = .iconOutlinedActionVisibilityOff
        case AssetsHelper.image(from: "Icons/IconOutlinedDefaultMockup"):
            self = .iconOutlinedDefaultMockup
        case AssetsHelper.image(from: "Icons/IconOutlinedDefaultMockupBackground"):
            self = .iconOutlinedDefaultMockupBackground
        case AssetsHelper.image(from: "Icons/IconOutlinedNavigationArrowBottom"):
            self = .iconOutlinedNavigationArrowBottom
        case AssetsHelper.image(from: "Icons/IconOutlinedNavigationArrowTop"):
            self = .iconOutlinedNavigationArrowTop
        case AssetsHelper.image(from: "Icons/IconOutlinedProductEmptyBackground"):
            self = .iconOutlinedProductEmptyBackground
        case AssetsHelper.image(from: "Icons/IconOutlinedSocialPerson"):
            self = .iconOutlinedSocialPerson
        default: return nil
        }
    }

    var rawValue: RawValue {
        switch self {
        case .iconOutlinedActionCancel:
            return AssetsHelper.image(from: "Icons/IconOutlinedActionCancel")
        case .iconOutlinedActionVisibility:
            return AssetsHelper.image(from: "Icons/IconOutlinedActionVisibility")
        case .iconOutlinedActionVisibilityOff:
            return AssetsHelper.image(from: "Icons/IconOutlinedActionVisibilityOff")
        case .iconOutlinedDefaultMockup:
            return AssetsHelper.image(from: "Icons/IconOutlinedDefaultMockup")
        case .iconOutlinedDefaultMockupBackground:
            return AssetsHelper.image(from: "Icons/IconOutlinedDefaultMockupBackground")
        case .iconOutlinedNavigationArrowBottom:
            return AssetsHelper.image(from: "Icons/IconOutlinedNavigationArrowBottom")
        case .iconOutlinedNavigationArrowTop:
            return AssetsHelper.image(from: "Icons/IconOutlinedNavigationArrowTop")
        case .iconOutlinedProductEmptyBackground:
            return AssetsHelper.image(from: "Icons/IconOutlinedProductEmptyBackground")
        case .iconOutlinedSocialPerson:
            return AssetsHelper.image(from: "Icons/IconOutlinedSocialPerson")
        }
    }
}
