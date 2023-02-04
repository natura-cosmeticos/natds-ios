import UIKit
import NatDS
import NatDSIcons

extension SnackbarItemViewController {
    @objc func showStandard() {
        let snackbar = NatSnackbar()
        snackbar.configure(body: "Lorem ipsum dolor sit amet.")
        snackbar.present(from: self)
    }

    @objc func showWithTitle() {
        let snackbar = NatSnackbar()
        snackbar.configure(body: "Lorem ipsum dolor a sit amet, neque porro.")
        snackbar.configure(title: "Title")
        snackbar.present(from: self)
    }

    @objc func showWithIcon() {
        let snackbar = NatSnackbar()
        snackbar.configure(body: "Lorem ipsum dolor amet, consectetur.")
        snackbar.configure(icon: getIcon(.outlinedDefaultMockup))
        snackbar.present(from: self)
    }

    // MARK: - Action Button

    @objc func showActionInline() {
        let snackbar = NatSnackbar()
        snackbar.configure(body: "Lorem ipsum dolor a sit amet, neque porro.")
        snackbar.configure(icon: getIcon(.outlinedDefaultMockup))
        snackbar.configure(actionButton: .button(title: "DEFAULT"))
        snackbar.configure(delegate: self, action: {_ in
            self.actionClicked()
        })
        snackbar.present(from: self)
    }

    @objc func showActionBlock() {
        let snackbar = NatSnackbar()
        snackbar.configure(body: "Lorem ipsum dolor sit amet, neque porro consectetur elit vivamus ornare.")
        snackbar.configure(icon: getIcon(.outlinedDefaultMockup))
        snackbar.configure(actionButton: .button(title: "LONGER TEXT DEFAULT"))
        snackbar.configure(delegate: self, action: {_ in
            self.actionClicked()
        })
        snackbar.present(from: self)
    }

    @objc func showActionIcon() {
        let snackbar = NatSnackbar()
        snackbar.configure(body: "Lorem ipsum dolor a sit amet neque.")
        snackbar.configure(actionButton: .iconButton(icon: getIcon(.outlinedDefaultMockup)))
        snackbar.configure(delegate: self, action: {_ in
            self.actionClicked()
        })
        snackbar.present(from: self)
    }

    // MARK: - Feedback

    @objc func showFeedbackSuccess() {
        let snackbar = NatSnackbar()
        snackbar.configure(body: "Lorem ipsum dolor sit a amet neque.")
        snackbar.configure(icon: getIcon(.outlinedDefaultMockup))
        snackbar.configure(feedback: .success)
        snackbar.present(from: self)
    }

    @objc func showFeedbackError() {
        let snackbar = NatSnackbar()
        snackbar.configure(body: "Lorem ipsum dolor sit a amet neque.")
        snackbar.configure(icon: getIcon(.outlinedDefaultMockup))
        snackbar.configure(feedback: .error)
        snackbar.present(from: self)
    }

    @objc func showFeedbackWarning() {
        let snackbar = NatSnackbar()
        snackbar.configure(body: "Lorem ipsum dolor sit a amet neque.")
        snackbar.configure(icon: getIcon(.outlinedDefaultMockup))
        snackbar.configure(feedback: .warning)
        snackbar.present(from: self)
    }

    @objc func showFeedbackInfo() {
        let snackbar = NatSnackbar()
        snackbar.configure(body: "Lorem ipsum dolor sit a amet neque.")
        snackbar.configure(icon: getIcon(.outlinedDefaultMockup))
        snackbar.configure(feedback: .info)
        snackbar.present(from: self)
    }

    // MARK: - Position

    @objc func showPositionTop() {
        let snackbar = NatSnackbar()
        snackbar.configure(body: "Lorem ipsum dolor sit a amet neque.")
        snackbar.configure(icon: getIcon(.outlinedDefaultMockup))
        snackbar.present(from: self, position: .topCenter)
    }

    @objc func showPositionBottom() {
        let snackbar = NatSnackbar()
        snackbar.configure(body: "Lorem ipsum dolor sit a amet neque.")
        snackbar.configure(icon: getIcon(.outlinedDefaultMockup))
        snackbar.present(from: self, position: .bottomCenter)
    }

    // MARK: - Timer

    @objc func showTimerMinimum() {
        let snackbar = NatSnackbar()
        snackbar.configure(body: "Lorem ipsum dolor sit a amet neque. (5 seconds)")
        snackbar.configure(icon: getIcon(.outlinedDefaultMockup))
        snackbar.present(from: self, timer: .minimum)
    }

    @objc func showTimerIntermediary() {
        let snackbar = NatSnackbar()
        snackbar.configure(body: "Lorem ipsum dolor sit a amet neque. (10 seconds)")
        snackbar.configure(icon: getIcon(.outlinedDefaultMockup))
        snackbar.present(from: self, timer: .intermediary)
    }

    @objc func showTimerIndeterminate() {
        let snackbar = NatSnackbar()
        snackbar.configure(body: "Lorem ipsum dolor sit a amet neque. (no auto dismiss)")
        snackbar.configure(icon: getIcon(.outlinedDefaultMockup))
        snackbar.configure(actionButton: .button(title: "Dismiss"))
        snackbar.configure(delegate: self, action: {_ in
            self.actionClicked()
        })
        snackbar.present(from: self, timer: .indeterminate)
    }

    @objc func showTimerCustom() {
        let snackbar = NatSnackbar()
        snackbar.configure(body: "Lorem ipsum dolor sit a amet neque. (15 seconds)")
        snackbar.configure(icon: getIcon(.outlinedDefaultMockup))
        snackbar.present(from: self, timer: .custom(15))
    }

    // MARK: - Animation

    @objc func showAnimationTopLeft() {
        let snackbar = NatSnackbar()
        snackbar.configure(body: "Lorem ipsum dolor sit a amet neque.")
        snackbar.configure(icon: getIcon(.outlinedDefaultMockup))
        snackbar.present(from: self, position: .topCenter, animation: .left)
    }

    @objc func showAnimationTopCenter() {
        let snackbar = NatSnackbar()
        snackbar.configure(body: "Lorem ipsum dolor sit a amet neque.")
        snackbar.configure(icon: getIcon(.outlinedDefaultMockup))
        snackbar.present(from: self, position: .topCenter, animation: .center)
    }

    @objc func showAnimationTopRight() {
        let snackbar = NatSnackbar()
        snackbar.configure(body: "Lorem ipsum dolor sit a amet neque.")
        snackbar.configure(icon: getIcon(.outlinedDefaultMockup))
        snackbar.present(from: self, position: .topCenter, animation: .right)
    }

    @objc func showAnimationBottomLeft() {
        let snackbar = NatSnackbar()
        snackbar.configure(body: "Lorem ipsum dolor sit a amet neque.")
        snackbar.configure(icon: getIcon(.outlinedDefaultMockup))
        snackbar.present(from: self, position: .bottomCenter, animation: .left)
    }

    @objc func showAnimationBottomCenter() {
        let snackbar = NatSnackbar()
        snackbar.configure(body: "Lorem ipsum dolor sit a amet neque.")
        snackbar.configure(icon: getIcon(.outlinedDefaultMockup))
        snackbar.present(from: self, position: .bottomCenter, animation: .center)
    }

    @objc func showAnimationBottomRight() {
        let snackbar = NatSnackbar()
        snackbar.configure(body: "Lorem ipsum dolor sit a amet neque.")
        snackbar.configure(icon: getIcon(.outlinedDefaultMockup))
        snackbar.present(from: self, position: .bottomCenter, animation: .right)
    }

    // MARK: - Dialog

    @objc func actionClicked() {
        let dialog = NatDialogController
            .standardStyleBuilder
            .configure(title: "Title")
            .configure(body: "ActionClicked")
            .configure(primaryButtonTitle: "Ok") {
                self.navigationController?.presentedViewController?.dismiss(animated: true)
            }
            .build()

        navigationController?.present(dialog, animated: true)
    }
}
