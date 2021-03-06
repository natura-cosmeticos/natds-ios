@testable import NatDS

final class NotificationCenterSpy {
    var postInvocations = 0
    var lastPostSent: (name: NSNotification.Name, object: Any?)?
    var invokedRemoveObserver: Bool?
    var addObserverInvocations = 0
    var invokedAddObserver: (name: NSNotification.Name?, object: Any?)?
}

extension NotificationCenterSpy: NotificationCenterPostable {
    func post(name: NSNotification.Name, object: Any?) {
        postInvocations += 1
        lastPostSent = (name: name, object: object)
    }
}

extension NotificationCenterSpy: NotificationCenterObservable {
    func removeObserver(_ observer: Any) {
        invokedRemoveObserver = true
    }

    func addObserver(_ observer: Any,
                     selector aSelector: Selector,
                     name aName: NSNotification.Name?,
                     object anObject: Any?) {

        addObserverInvocations += 1
        invokedAddObserver = (aName, anObject)
    }
}
