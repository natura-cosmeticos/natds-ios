import NatDS
import UIKit
import NatDSIcons

class ChipViewController: UIViewController, SampleItem {
    static var name = "Chip"

    // MARK: - Private properties

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = false
        scrollView.keyboardDismissMode = .interactive
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private func createChip(size: NatChip.Size = .semi,
                            color: NatChip.Color = .neutral,
                            text: String,
                            state: UIControl.State = .normal,
                            icon: String? = nil,
                            avatar: NatAvatar? = nil,
                            position: NatChip.Position? = nil) -> NatChip {

        let chip = NatChip(size: size, color: color)
        chip.configure(text: text)
        chip.configure(state: state)
        if let position = position {
            if let icon = icon {
                chip.configure(icon: icon, position: position)
            }
            if let avatar = avatar {
                chip.configure(avatar: avatar, position: position)
            }
        }

        chip.translatesAutoresizingMaskIntoConstraints = false
        return chip
    }

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Private methods

    private func setup() {
        title = Self.name
        view.backgroundColor = NatColors.background
        let icon = getIcon(.outlinedDefaultMockup)
        let avatar = NatAvatar(size: .standard, type: .label)
        avatar.configure(name: "Design System")

        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        addConstraints()

        stackView.addArrangedSubview(createChip(text: "Neutral color"))
        stackView.addArrangedSubview(createChip(color: .primary, text: "Primary color"))
        stackView.addArrangedSubview(createChip(color: .secondary, text: "Secondary color"))
        stackView.addArrangedSubview(createChip(color: .custom(NatColors.link), text: "Custom color"))

        stackView.addArrangedSubview(createChip(size: .semi, text: "Semi size"))
        stackView.addArrangedSubview(createChip(size: .semiX, text: "SemiX size"))
        stackView.addArrangedSubview(createChip(size: .medium, text: "Medium size"))

        stackView.addArrangedSubview(createChip(text: "Left icon",
                                                icon: icon,
                                                position: .left))
        stackView.addArrangedSubview(createChip(text: "Right icon",
                                                icon: icon,
                                                position: .right))
        let bothSidesIconChip = createChip(text: "Both sides icon",
                                           icon: icon,
                                           position: .left)
        bothSidesIconChip.configure(icon: icon,
                                    position: .right)
        stackView.addArrangedSubview(bothSidesIconChip)

        stackView.addArrangedSubview(createChip(text: "Left avatar",
                                                avatar: avatar,
                                                position: .left))
        stackView.addArrangedSubview(createChip(text: "Right avatar",
                                                avatar: avatar,
                                                position: .right))
        let bothSidesAvatarChip = createChip(text: "Both sides avatar",
                                             avatar: avatar,
                                             position: .left)
        bothSidesAvatarChip.configure(avatar: avatar,
                                      position: .right)
        stackView.addArrangedSubview(bothSidesAvatarChip)

        let avatarAndIconChip = createChip(text: "Avatar and icon",
                                           avatar: avatar,
                                           position: .left)
        avatarAndIconChip.configure(icon: icon,
                                    position: .right)
        stackView.addArrangedSubview(avatarAndIconChip)

        let iconAndAvatarChip = createChip(text: "Icon and avatar",
                                           icon: icon,
                                           position: .left)
        iconAndAvatarChip.configure(avatar: avatar,
                                    position: .right)

        stackView.addArrangedSubview(iconAndAvatarChip)

        stackView.addArrangedSubview(createChip(text: "Focused chip",
                                                state: .focused))
        stackView.addArrangedSubview(createChip(text: "Disbled chip",
                                                state: .disabled))

    }

    private func addConstraints() {

        let constraints = [
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
