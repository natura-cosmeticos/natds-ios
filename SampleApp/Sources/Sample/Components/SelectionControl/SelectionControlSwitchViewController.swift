import UIKit
import NatDS

class SelectionControlSwitchViewController: UIViewController, SampleItem {
    
    static let name = "Selection Control Switch"
    
    private let switchcontrol: NatSelectionControl = {
        let checkbox = NatSelectionControl(style: .switch)
        checkbox.isSelected = false
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Self.name
        view.backgroundColor = NatColors.background
        addCustomSwitch()
    }
    
    func addCustomSwitch() {
        self.view.addSubview(switchcontrol)
        switchcontrol.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        switchcontrol.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
}
