import UIKit
import NatDS

class AvatarItemViewController: UIViewController, SampleItem {
    static var name = "Avatar"
    
    private lazy var smallStackView = createStackView()
    private lazy var mediumStackView = createStackView()
    private lazy var largeStackView = createStackView()
    private lazy var largeXStackView = createStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Self.name
        view.backgroundColor = NatColors.background
        
        setup()
    }
    
    private func setup() {
        view.addSubview(smallStackView)
        view.addSubview(mediumStackView)
        view.addSubview(largeStackView)
        view.addSubview(largeXStackView)
        
        let smallAvatars = createAvatars(style: .small, image: IllustrationIcons.Lined.sad?.tintedWithColor(NatColors.onPrimary) ?? UIImage(), initials: "DS")
        smallAvatars.forEach { smallStackView.addArrangedSubview($0) }

        let mediumAvatars = createAvatars(style: .medium, image: IllustrationIcons.Lined.sad?.tintedWithColor(NatColors.onPrimary) ?? UIImage(), initials: "DS")
        mediumAvatars.forEach { mediumStackView.addArrangedSubview($0) }
        
        let largeAvatars = createAvatars(style: .large, image: IllustrationIcons.Lined.sad?.tintedWithColor(NatColors.onPrimary) ?? UIImage(), initials: "DS")
        largeAvatars.forEach { largeStackView.addArrangedSubview($0) }

        let largeXAvatars = createAvatars(style: .largeX, image: IllustrationIcons.Lined.sad?.tintedWithColor(NatColors.onPrimary) ?? UIImage(), initials: "DS")
        largeXAvatars.forEach { largeXStackView.addArrangedSubview($0) }

        addConstraints()
    }
    
    private func createAvatars(style: NatAvatar.Style, image: UIImage, initials: String) -> [NatAvatar] {
        (0...2).map { value in
            let avatar = NatAvatar(style: style)
            
            if value == 1 {
                avatar.configure(initials: initials)
            }
            
            if value == 2 {
                avatar.configure(image: image)
            }
            return avatar
        }
    }

    private func createStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = NatSpacing.tiny
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }
    
    private func addConstraints() {
        let constraints = [
            smallStackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: NatSpacing.small
            ),
            smallStackView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -NatSpacing.standard
            ),
            smallStackView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: NatSpacing.standard
            ),
            smallStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            mediumStackView.topAnchor.constraint(
                equalTo: smallStackView.bottomAnchor,
                constant: NatSpacing.small
            ),
            mediumStackView.widthAnchor.constraint(equalTo: smallStackView.widthAnchor),
            mediumStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            largeStackView.topAnchor.constraint(
                equalTo: mediumStackView.bottomAnchor,
                constant: NatSpacing.small
            ),
            largeStackView.widthAnchor.constraint(equalTo: mediumStackView.widthAnchor),
            largeStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            largeXStackView.topAnchor.constraint(
                equalTo: largeStackView.bottomAnchor,
                constant: NatSpacing.small
            ),
            largeXStackView.widthAnchor.constraint(equalTo: largeStackView.widthAnchor),
            largeXStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }
    
}
