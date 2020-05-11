import UIKit

extension UIFont {
    func getWeight() -> UIFont.Weight? {
        let attributeKey = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")

        guard let weightAsString = self.fontDescriptor
            .fontAttributes[attributeKey] as? String else {
            return nil
        }

        let weight: UIFont.Weight?

        switch weightAsString {
        case "CTFontMediumUsage": weight = UIFont.Weight.medium
        case "CTFontRegularUsage": weight = UIFont.Weight.regular
        default: weight = nil
        }

        return weight
    }
}
