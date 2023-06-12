import UIKit
import NatDS
import NatDSIcons

class TagViewController: UIViewController, SampleItem {
    static var name: String = "Tag"

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = NatSpacing.semi
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private var tagDefaultPrimary: NatTag = {
        let tag = NatTag(style: .defaultAlert)
        tag.configure(text: "Default Primary Small")
        tag.configure(color: .primary)
        tag.configure(size: .small)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()
    
    private var tagCustomDefaultPrimary: NatTag = {
        let tag = NatTag(style: .defaultAlert, theme: .avonLight)
        tag.configure(text: "Default Primary Avon")
        tag.configure(color: .primary)
        tag.configure(size: .small)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()

    private var tagDefaultSecondary: NatTag = {
        let tag = NatTag(style: .defaultAlert)
        tag.configure(text: "Default Secondary Standard")
        tag.configure(color: .secondary)
        tag.configure(size: .standard)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()

    private var tagLeftSuccess: NatTag = {
        let tag = NatTag(style: .leftAlert)
        tag.configure(text: "Left Success Small")
        tag.configure(color: .success)
        tag.configure(size: .small)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()

    private var tagLeftAlert: NatTag = {
        let tag = NatTag(style: .leftAlert)
        tag.configure(text: "Left Alert Standard")
        tag.configure(color: .alert)
        tag.configure(size: .standard)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()

    private var tagRightWarning: NatTag = {
        let tag = NatTag(style: .rightAlert)
        tag.configure(text: "Right Warning Small")
        tag.configure(color: .warning)
        tag.configure(size: .small)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()

    private var tagRightLink: NatTag = {
        let tag = NatTag(style: .rightAlert)
        tag.configure(text: "Right Link Standard")
        tag.configure(color: .link)
        tag.configure(size: .standard)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()

    private var tagDefaultCustom: NatTag = {
        let color: NatTag.Color = .custom(backgroundColor: UIColor.black, labelColor: UIColor.white)
        let tag = NatTag(style: .defaultAlert, color: color, size: .small, icon: getIcon(.outlinedDefaultMockup))
        tag.configure(text: "Custom color and icon Small")
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()

    private var tagDefaultStandardCustom: NatTag = {
        let color: NatTag.Color = .custom(backgroundColor: NatColors.mediumEmphasis, labelColor: UIColor.white)
        let tag = NatTag(style: .defaultAlert, color: color, size: .standard, icon: getIcon(.outlinedDefaultMockup))
        tag.configure(text: "Custom color and icon Standard")
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()

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
        stackView.addArrangedSubview(tagRightLink)
        stackView.addArrangedSubview(tagDefaultCustom)
        stackView.addArrangedSubview(tagDefaultStandardCustom)

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
