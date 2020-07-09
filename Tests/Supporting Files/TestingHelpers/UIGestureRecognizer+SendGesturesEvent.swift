import UIKit

extension  UIGestureRecognizer {
    typealias TargetActions = [(target: AnyObject, action: Selector)]

    private func getTargetActions() -> TargetActions {
        guard let targets = value(forKeyPath: "_targets") as? [NSObject] else { return [] }

        var targetsActions: TargetActions = []

        for target in targets {
            let description = String(describing: target).trimmingCharacters(in: CharacterSet(charactersIn: "()"))

            var selectorString = description.components(separatedBy: ", ").first ?? ""
            selectorString = selectorString.components(separatedBy: "=").last ?? ""

            let selector = NSSelectorFromString(selectorString)

            if let targetActionPairClass = NSClassFromString("UIGestureRecognizerTarget"),
                let targetVar = class_getInstanceVariable(targetActionPairClass, "_target"),
                let targetObject = object_getIvar(target, targetVar) {
                targetsActions.append((target: targetObject as AnyObject, action: selector))
            }
        }

        return targetsActions
    }

    func sendGesturesEvents() {
        getTargetActions()
            .forEach { $0.target
                .performSelector(
                    onMainThread: $0.action,
                    with: self,
                    waitUntilDone: true
                )
            }
    }
}
