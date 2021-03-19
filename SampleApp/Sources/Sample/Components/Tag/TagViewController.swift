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
        stackView.spacing = NatSpacing.xLarge
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        title = Self.name
        view.backgroundColor = NatColors.background
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(tagDefaultPrimary)
        stackView.addArrangedSubview(tagDefaultSecondary)
        stackView.addArrangedSubview(tagLeftSuccess)
        stackView.addArrangedSubview(tagLeftAlert)
        stackView.addArrangedSubview(tagRightWarning)
        stackView.addArrangedSubview(tagRightLink)
        
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
