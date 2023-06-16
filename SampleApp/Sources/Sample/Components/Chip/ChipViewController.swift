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

    private let neutralColorChip: NatChip = {
        let chip = NatChip()
        chip.configure(text: "Neutral color")
        return chip
    }()

    private let primaryColorChip: NatChip = {
        let chip = NatChip(color: .primary)
        chip.configure(text: "Primary color")
        return chip
    }()

    private let secondaryColorChip: NatChip = {
        let chip = NatChip(color: .secondary)
        chip.configure(text: "Secondary color")
        return chip
    }()

    private let customColorChip: NatChip = {
        let chip = NatChip(color: .custom(selectedColor: NatColors.link,
                                          labelColor: NatColors.lowEmphasis,
                                          borderColor: NatColors.alert))
        chip.configure(text: "Custom color")
        return chip
    }()
    
    private let customThemeChip: NatChip = {
        let chip = NatChip(theme: .avonLight)
        chip.configure(text: "Chip with Avon theme")
        return chip
    }()

    private let chipWithAction: NatChip = {
        let chip = NatChip()
        chip.configure(text: "Chip with action")
        return chip
    }()

    private let semiSizeChip: NatChip = {
        let chip = NatChip(size: .semi)
        chip.configure(text: "Semi size")
        return chip
    }()

    private let semiXSizeChip: NatChip = {
        let chip = NatChip(size: .semiX)
        chip.configure(text: "SemiX size")
        return chip
    }()

    private let mediumSizeChip: NatChip = {
        let chip = NatChip(size: .medium)
        chip.configure(text: "Medium size")
        return chip
    }()

    private let leftIconChip: NatChip = {
        let icon = getIcon(.outlinedDefaultMockup)
        let chip = NatChip()
        chip.configure(text: "Left icon")
        chip.configure(icon: icon, position: .left)
        return chip
    }()

    private let rightIconChip: NatChip = {
        let icon = getIcon(.outlinedDefaultMockup)
        let chip = NatChip()
        chip.configure(text: "Right icon")
        chip.configure(icon: icon, position: .right)
        return chip
    }()

    private let bothSidesIconChip: NatChip = {
        let icon = getIcon(.outlinedDefaultMockup)
        let chip = NatChip()
        chip.configure(text: "Both sides icon")
        chip.configure(icon: icon, position: .left)
        chip.configure(icon: icon, position: .right)
        return chip
    }()

    private let leftAvatarChip: NatChip = {
        let avatar = NatAvatar(size: .standard, type: .label)
        avatar.configure(name: "Design System")
        let chip = NatChip()
        chip.configure(text: "Left avatar")
        chip.configure(avatar: avatar, position: .left)
        return chip
    }()

    private let rightAvatarChip: NatChip = {
        let avatar = NatAvatar(size: .standard, type: .label)
        avatar.configure(name: "Design System")
        let chip = NatChip()
        chip.configure(text: "Right avatar")
        chip.configure(avatar: avatar, position: .right)
        return chip
    }()

    private let iconAndAvatarChip: NatChip = {
        let icon = getIcon(.outlinedDefaultMockup)
        let avatar = NatAvatar(size: .standard, type: .label)
        avatar.configure(name: "Design System")
        let chip = NatChip()
        chip.configure(text: "Icon and Avatar")
        chip.configure(icon: icon, position: .left)
        chip.configure(avatar: avatar, position: .right)
        return chip
    }()

    private let avatarAndIconChip: NatChip = {
        let icon = getIcon(.outlinedDefaultMockup)
        let avatar = NatAvatar(size: .standard, type: .label)
        avatar.configure(name: "Design System")
        let chip = NatChip()
        chip.configure(text: "Avatar and icon")
        chip.configure(avatar: avatar, position: .left)
        chip.configure(icon: icon, position: .right)
        return chip
    }()

    private let focusedChip: NatChip = {
        let chip = NatChip()
        chip.configure(text: "Focused")
        chip.configure(state: .focused)
        return chip
    }()

    private let disabledChip: NatChip = {
        let chip = NatChip()
        chip.configure(text: "Disabled")
        chip.configure(state: .disabled)
        return chip
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupHandlers()
    }

    // MARK: - Private methods

    private func setup() {
        title = Self.name
        view.backgroundColor = NatColors.background
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(neutralColorChip)
        stackView.addArrangedSubview(primaryColorChip)
        stackView.addArrangedSubview(secondaryColorChip)
        stackView.addArrangedSubview(customColorChip)
        stackView.addArrangedSubview(customThemeChip)
        stackView.addArrangedSubview(chipWithAction)
        stackView.addArrangedSubview(semiSizeChip)
        stackView.addArrangedSubview(semiXSizeChip)
        stackView.addArrangedSubview(mediumSizeChip)
        stackView.addArrangedSubview(leftIconChip)
        stackView.addArrangedSubview(rightIconChip)
        stackView.addArrangedSubview(bothSidesIconChip)
        stackView.addArrangedSubview(leftAvatarChip)
        stackView.addArrangedSubview(rightAvatarChip)
        stackView.addArrangedSubview(iconAndAvatarChip)
        stackView.addArrangedSubview(avatarAndIconChip)
        stackView.addArrangedSubview(focusedChip)
        stackView.addArrangedSubview(disabledChip)
        addConstraints()
    }

    private func setupHandlers() {
        chipWithAction.configure { isSelected in
            let alert = UIAlertController(title: "Taps",
                                          message: "selected: \(isSelected)",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok",
                                          style: .default,
                                          handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
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
