import Foundation

protocol NotificationCenterProtocol {
    func removeObserver(_ observer: Any)
    func addObserver(_ observer: Any,
                     selector aSelector: Selector,
                     name aName: NSNotification.Name?,
                     object anObject: Any?)
}

extension NotificationCenter: NotificationCenterProtocol {}
