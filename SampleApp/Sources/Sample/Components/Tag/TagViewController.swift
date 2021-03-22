import UIKit
import NatDS

class TagViewController: UIViewController, SampleItem {
    static var name: String = "Tag"

    private let defaultTagView = NatTag(style: .defaultAlert)
    private let leftTagView = NatTag(style: .leftAlert)
    private let rightTagView = NatTag(style: .rightAlert)

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = NatSpacing.large
        stackView.distribution = .fillProportionally
        stackView.alignment = .top
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        title = Self.name
        view.backgroundColor = NatColors.background

        view.addSubview(stackView)
        stackView.addArrangedSubview(createTag(style: .defaultAlert, text: "Alert"))
        stackView.addArrangedSubview(createTag(style: .leftAlert, text: "Alert"))
        stackView.addArrangedSubview(createTag(style: .rightAlert, text: "Alert"))

        let constraints = [
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    private func createTag(style: NatTag.Style, text: String) -> NatTag {
        let tag = NatTag(style: style)
        tag.configure(text: text)
        return tag
    }
}
