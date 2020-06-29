@testable import NatDS

class NotificationCenterSpy: NotificationCenterProtocol {
    var invokedRemoveObserver: Bool?
    var invokedAddObserver: (name: NSNotification.Name?, object: Any?)?

    func removeObserver(_ observer: Any) {
        invokedRemoveObserver = true
    }

    func addObserver(_ observer: Any, selector aSelector: Selector,
                     name aName: NSNotification.Name?, object anObject: Any?) {
        invokedAddObserver = (aName, anObject)
    }
}
