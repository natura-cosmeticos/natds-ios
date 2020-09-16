import UIKit
import NatDS

class TagViewController: UIViewController, SampleItem {
    static var name: String = "Tag"

    private lazy var defaultAlert: NatTag = {
        let tag = NatTag(style: .defaultAlert)
        tag.configure(text: "Label Text")
        return tag
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        title = Self.name
        view.backgroundColor = NatColors.background

        view.addSubview(defaultAlert)

        let constraints = [
            defaultAlert.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            defaultAlert.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
