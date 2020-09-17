import UIKit
import NatDS

class TagViewController: UIViewController, SampleItem {
    static var name: String = "Tag"

    private let tagView = NatTag(style: .defaultAlert)

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        tagView.configure(text: "Label Text")
    }

    private func setup() {
        title = Self.name
        view.backgroundColor = NatColors.background

        view.addSubview(tagView)

        let constraints = [
            tagView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tagView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
