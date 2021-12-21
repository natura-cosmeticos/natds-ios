/// Alias for a closure that accepts no parameters and has no return value
public typealias ActionHandler = () -> Void

extension NatDialogController {
    /// A view model that is used to set the Dialog's texts and subviews
    public class ViewModel {
        var titleView: DialogHeaderView?
        var topDividerView: UIView?
        var bodyView: UIView?
        var bottomDividerView: UIView?
        var footerView: DialogFooterView?
        var isDismissable = true
        var dismissCompletionHandler: ActionHandler?
    }
}
