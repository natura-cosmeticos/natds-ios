import Foundation

protocol NotificationCenterPostable {
    func post(name: NSNotification.Name, object: Any?)
}

extension NotificationCenter: NotificationCenterPostable {}
