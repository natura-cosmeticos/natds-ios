import UIKit
import NatDS

class GaYaTagViewController: UIViewController, SampleItem {
    static var name: String = "GaYaTag"

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = NatSpacing.semi
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private var tagDefaultPrimary: GaYaTag = {
        let tag = GaYaTag(style: .defaultAlert)
        tag.configure(text: "Default Primary Small")
        tag.configure(color: .primary)
        tag.configure(size: .small)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()

    private var tagCustomDefaultPrimary: GaYaTag = {
        let tag = GaYaTag(style: .defaultAlert, icon: getIcon(.filledActionAdd))
        tag.configure(text: "Default Primary Lightest Small - IL")
        tag.configure(color: .primaryLightest)
        tag.configure(size: .small)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()

    private var tagDefaultSecondary: GaYaTag = {
        let tag = GaYaTag(style: .defaultAlert, icon: getIcon(.filledActionAdd), iconPosition: .right)
        tag.configure(text: "Default Primary Darkest Small - IR")
        tag.configure(color: .primaryDarkest)
        tag.configure(size: .small)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()

    private var tagLeftSuccess: GaYaTag = {
        let tag = GaYaTag(style: .leftAlert)
        tag.configure(text: "Left Secondary Small")
        tag.configure(color: .secondary)
        tag.configure(size: .small)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()
    
    private var tagLeftAlert: GaYaTag = {
        let tag = GaYaTag(style: .leftAlert, icon: getIcon(.filledActionCheck))
        tag.configure(text: "Left Secondary Lightest - IL")
        tag.configure(color: .secondaryLightest)
        tag.configure(size: .small)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()

    private var tagRightWarning: GaYaTag = {
        let tag = GaYaTag(style: .rightAlert, icon: getIcon(.filledActionCheck), iconPosition: .right)
        tag.configure(text: "Right Secondary Darkest - IR")
        tag.configure(color: .info)
        tag.configure(size: .medium)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()
    /*
    private var tagRightLink: NatTag = {
        let tag = NatTag(style: .rightAlert)
        tag.configure(text: "Right Link Standard")
        tag.configure(color: .link)
        tag.configure(size: .standard)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()

*/
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        title = Self.name
        view.backgroundColor = NatColors.background

        view.addSubview(stackView)
        stackView.addArrangedSubview(tagDefaultPrimary)
        stackView.addArrangedSubview(tagCustomDefaultPrimary)
        stackView.addArrangedSubview(tagDefaultSecondary)
        stackView.addArrangedSubview(tagLeftSuccess)
        stackView.addArrangedSubview(tagLeftAlert)
    
        stackView.addArrangedSubview(tagRightWarning)
        /*
        stackView.addArrangedSubview(tagRightLink)
*/
        let constraints = [
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    private func createTag(style: GaYaTag.Style, text: String) -> GaYaTag {
        let tag = GaYaTag(style: style)
        tag.configure(text: text)
        return tag
    }
}

