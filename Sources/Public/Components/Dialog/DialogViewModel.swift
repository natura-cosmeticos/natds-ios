public typealias ActionHandler = () -> Void

extension NatDialogController {
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
