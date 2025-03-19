//
//  GaYaChipFilterViewController.swift
//  GaYa DS-SampleApp
//
//  Created by Hayna.Cardoso on 15/06/24.
//  Copyright © 2024 Natura. All rights reserved.
//

import NatDS
import UIKit

class GaYaChipFilterViewController: UIViewController, SampleItem {
    static var name = "GaYaChipFilter"

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
        stack.spacing = 12
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let colorsLabel: UILabel = {
        let label = UILabel()
        label.text = " Colors"
        label.textColor = GaYaColors.highEmphasis
        label.font = GaYaFonts.font(ofSize: .heading5, withWeight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private let sizesLabel: UILabel = {
        let label = UILabel()
        label.text = " Sizes"
        label.textColor = GaYaColors.highEmphasis
        label.font = GaYaFonts.font(ofSize: .heading5, withWeight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private let iconLabel: UILabel = {
        let label = UILabel()
        label.text = " Icon"
        label.textColor = GaYaColors.highEmphasis
        label.font = GaYaFonts.font(ofSize: .heading5, withWeight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private let avatarLabel: UILabel = {
        let label = UILabel()
        label.text = " Avatar"
        label.textColor = GaYaColors.highEmphasis
        label.font = GaYaFonts.font(ofSize: .heading5, withWeight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private let disabledLabel: UILabel = {
        let label = UILabel()
        label.text = " Disabled, Theme and Action"
        label.textColor = GaYaColors.highEmphasis
        label.font = GaYaFonts.font(ofSize: .heading6, withWeight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private let colorStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()
    
    private let colorStackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()
    
    private let colorStackView3: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let sizeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let iconStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let avatarStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let primaryChip: GaYaChipFilter = {
        let chip = GaYaChipFilter(color: .primary)
        chip.configure(text: "primary")
        return chip
    }()
    
    private let onPrimaryChip: GaYaChipFilter = {
        let chip = GaYaChipFilter(color: .onPrimary)
        chip.configure(text: "on primary")
        return chip
    }()
    
    private let secondaryChip: GaYaChipFilter = {
        let chip = GaYaChipFilter(color: .secondary)
        chip.configure(text: "secondary")
        return chip
    }()
    
    private let onSecondaryChip: GaYaChipFilter = {
        let chip = GaYaChipFilter(color: .onSecondary)
        chip.configure(text: "on secondary")
        return chip
    }()

    private let neutralChip: GaYaChipFilter = {
        let chip = GaYaChipFilter(color: .neutral)
        chip.configure(text: "neutral")
        return chip
    }()

    private let inverseChip: GaYaChipFilter = {
        let chip = GaYaChipFilter(color: .inverse)
        chip.configure(text: "inverse")
        return chip
    }()

    private let customThemeChip: GaYaChipFilter = {
        let chip = GaYaChipFilter(color: .primary, theme: .avonv2Light)
        chip.configure(text: "chip Avon")
        return chip
    }()
    
    private let disabledChip: GaYaChipFilter = {
        let chip = GaYaChipFilter(color: .primary)
        chip.configure(text: "disabled")
        chip.configure(state: .disabled)
        return chip
    }()
    
    private let chipWithAction: GaYaChipFilter = {
        let filter = GaYaChipFilter()
        filter.configure(text: "chip with action")
        return filter
    }()

    private let semiSizeChip: GaYaChipFilter = {
        let chip = GaYaChipFilter(size: .semi)
        chip.configure(text: "semi size")
        return chip
    }()

    private let semiXSizeChip: GaYaChipFilter = {
        let chip = GaYaChipFilter(size: .semiX)
        chip.configure(text: "semiX size")
        return chip
    }()

    private let mediumSizeChip: GaYaChipFilter = {
        let chip = GaYaChipFilter(size: .medium)
        chip.configure(text: "medium size")
        return chip
    }()

    private let leftIconChip: GaYaChipFilter = {
        let icon = getIcon(.outlinedDefaultMockup)
        let chip = GaYaChipFilter()
        chip.configure(text: "left icon")
        chip.configure(icon: icon, position: .left)
        return chip
    }()

    private let rightIconChip: GaYaChipFilter = {
        let icon = getIcon(.outlinedDefaultMockup)
        let chip = GaYaChipFilter()
        chip.configure(text: "right icon")
        chip.configure(icon: icon, position: .right)
        return chip
    }()

    private let bothSidesIconChip: GaYaChipFilter = {
        let icon = getIcon(.outlinedDefaultMockup)
        let chip = GaYaChipFilter()
        chip.configure(text: "both sides icon")
        chip.configure(icon: icon, position: .left)
        chip.configure(icon: icon, position: .right)
        return chip
    }()

    private let leftAvatarChip: GaYaChipFilter = {
        let avatar = GaYaAvatar(size: .standard, type: .label)
        avatar.configure(name: "Design System")
        let chip = GaYaChipFilter()
        chip.configure(text: "Left avatar")
        chip.configure(avatar: avatar, position: .left)
        return chip
    }()

    private let rightAvatarChip: GaYaChipFilter = {
        let avatar = GaYaAvatar(size: .standard, type: .label)
        avatar.configure(name: "Design System")
        let chip = GaYaChipFilter()
        chip.configure(text: "Right avatar")
        chip.configure(avatar: avatar, position: .right)
        return chip
    }()

    private let iconAndAvatarChip: GaYaChipFilter = {
        let icon = getIcon(.outlinedDefaultMockup)
        let avatar = GaYaAvatar(size: .standard, type: .label)
        avatar.configure(name: "Design System")
        let chip = GaYaChipFilter()
        chip.configure(text: "Icon and Avatar")
        chip.configure(icon: icon, position: .left)
        chip.configure(avatar: avatar, position: .right)
        return chip
    }()

    private let avatarAndIconChip: GaYaChipFilter = {
        let icon = getIcon(.outlinedDefaultMockup)
        let avatar = GaYaAvatar(size: .standard, type: .label)
        avatar.configure(name: "Design System")
        let chip = GaYaChipFilter()
        chip.configure(text: "Avatar and icon")
        chip.configure(avatar: avatar, position: .left)
        chip.configure(icon: icon, position: .right)
        return chip
    }()

//    private let focusedChip: GaYaChipFilter = {
//        let chip = GaYaChipFilter()
//        chip.configure(text: "Focused")
//        chip.configure(state: .focused)
//        return chip
//    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupHandlers()
    }

    // MARK: - Private methods

    private func setup() {
        title = Self.name
        view.backgroundColor = hexStringToUIColor(hex: "#f4f4f4")
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(colorsLabel)
        stackView.addArrangedSubview(colorStackView)
        stackView.addArrangedSubview(colorStackView2)
        stackView.addArrangedSubview(disabledLabel)
        stackView.addArrangedSubview(colorStackView3)
        stackView.addArrangedSubview(sizesLabel)
        stackView.addArrangedSubview(sizeStackView)
        stackView.addArrangedSubview(iconLabel)
        stackView.addArrangedSubview(iconStackView)
        stackView.addArrangedSubview(avatarLabel)
        stackView.addArrangedSubview(avatarStackView)
        
        colorStackView.addArrangedSubview(primaryChip)
        colorStackView.addArrangedSubview(onPrimaryChip)
        colorStackView.addArrangedSubview(secondaryChip)
        
        colorStackView2.addArrangedSubview(onSecondaryChip)
        colorStackView2.addArrangedSubview(neutralChip)
        colorStackView2.addArrangedSubview(inverseChip)
        
        colorStackView3.addArrangedSubview(customThemeChip)
        colorStackView3.addArrangedSubview(disabledChip)
        colorStackView3.addArrangedSubview(chipWithAction)
        
        sizeStackView.addArrangedSubview(semiSizeChip)
        sizeStackView.addArrangedSubview(semiXSizeChip)
        sizeStackView.addArrangedSubview(mediumSizeChip)
        
        iconStackView.addArrangedSubview(leftIconChip)
        iconStackView.addArrangedSubview(leftIconChip)
        iconStackView.addArrangedSubview(rightIconChip)
        iconStackView.addArrangedSubview(bothSidesIconChip)
        iconStackView.addArrangedSubview(iconAndAvatarChip)
        
        avatarStackView.addArrangedSubview(leftAvatarChip)
        avatarStackView.addArrangedSubview(rightAvatarChip)
        avatarStackView.addArrangedSubview(avatarAndIconChip)
        
        addConstraints()
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
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


