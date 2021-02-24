import UIKit
import NatDS
import NatDSIcons

class AvatarItemViewController: UIViewController, SampleItem {
    static var name = "Avatar"
    
    private lazy var standardStackView = createStackView()
    private lazy var semiStackView = createStackView()
    private lazy var semixStackView = createStackView()
    private lazy var mediumStackView = createStackView()
    private lazy var largexxxStackView = createStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Self.name
        view.backgroundColor = NatColors.background
        
        setup()
    }
    
    private func setup() {
        view.addSubview(standardStackView)
        view.addSubview(semiStackView)
        view.addSubview(semixStackView)
        view.addSubview(mediumStackView)
        view.addSubview(largexxxStackView)
        
        let standardAvatars = createAvatars(size: .standard,
                                            image: IllustrationIcons.Lined.sad?.tintedWithColor(NatColors.onPrimary) ?? UIImage(),
                                            name: "Natura Design System")
        standardAvatars.forEach { standardStackView.addArrangedSubview($0) }

        let semiAvatars = createAvatars(size: .semi,
                                        image: IllustrationIcons.Lined.sad?.tintedWithColor(NatColors.onPrimary) ?? UIImage(),
                                        name: "Natura Design System")
        semiAvatars.forEach { semiStackView.addArrangedSubview($0) }
        
        let semixAvatars = createAvatars(size: .semiX,
                                         image: IllustrationIcons.Lined.sad?.tintedWithColor(NatColors.onPrimary) ?? UIImage(),
                                         name: "Natura Design System")
        semixAvatars.forEach { semixStackView.addArrangedSubview($0) }
        
        let mediumAvatars = createAvatars(size: .medium,
                                          image: IllustrationIcons.Lined.sad?.tintedWithColor(NatColors.onPrimary) ?? UIImage(),
                                          name: "Natura Design System")
        mediumAvatars.forEach { mediumStackView.addArrangedSubview($0) }

        let largexxxAvatars = createAvatars(size: .largeXXX,
                                            image: IllustrationIcons.Lined.sad?.tintedWithColor(NatColors.onPrimary) ?? UIImage(),
                                            name: "Natura Design System")
        largexxxAvatars.forEach { largexxxStackView.addArrangedSubview($0) }

        addConstraints()
    }
    
    private func createAvatars(size: NatAvatar.Size, image: UIImage, name: String) -> [NatAvatar] {
        (0...2).map { value in
            let avatar = NatAvatar(size: size)
            
            if value == 0 {
                avatar.configureWithDefaultIcon()
            }
            
            if value == 1 {
                avatar.configure(name: name)
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
            // STANDARD
            standardStackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: NatSpacing.small
            ),
            standardStackView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -NatSpacing.standard
            ),
            standardStackView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: NatSpacing.standard
            ),
            standardStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            // SEMI
            semiStackView.topAnchor.constraint(
                equalTo: standardStackView.bottomAnchor,
                constant: NatSpacing.standard
            ),
            semiStackView.widthAnchor.constraint(equalTo: standardStackView.widthAnchor),
            semiStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // SEMIX
            semixStackView.topAnchor.constraint(
                equalTo: semiStackView.bottomAnchor,
                constant: NatSpacing.standard
            ),
            semixStackView.widthAnchor.constraint(equalTo: semiStackView.widthAnchor),
            semixStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // MEDIUM
            mediumStackView.topAnchor.constraint(
                equalTo: semixStackView.bottomAnchor,
                constant: NatSpacing.standard
            ),
            mediumStackView.widthAnchor.constraint(equalTo: semixStackView.widthAnchor),
            mediumStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // LARGEXXX
            largexxxStackView.topAnchor.constraint(
                equalTo: mediumStackView.bottomAnchor,
                constant: NatSpacing.standard
            ),
            largexxxStackView.widthAnchor.constraint(equalTo: mediumStackView.widthAnchor),
            largexxxStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }
    
}
