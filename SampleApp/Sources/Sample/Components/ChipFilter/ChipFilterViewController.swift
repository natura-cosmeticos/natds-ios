//
//  ChipFilterViewController.swift
//  NatDS-SampleApp
//
//  Created by Hayna.Cardoso on 04/05/23.
//  Copyright © 2023 Natura. All rights reserved.
//

import NatDS
import UIKit
import NatDSIcons

class ChipFilterViewController: UIViewController, SampleItem {
    static var name = "ChipFilter"

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

    private let neutralColorChipFilter: NatChipFilter = {
        let filter = NatChipFilter()
        filter.configure(text: "Neutral color")
        return filter
    }()

    private let primaryColorChipFilter: NatChipFilter = {
        let filter = NatChipFilter(color: .primary)
        filter.configure(text: "Primary color")
        return filter
    }()

    private let secondaryColorChipFilter: NatChipFilter = {
        let filter = NatChipFilter(color: .secondary)
        filter.configure(text: "Secondary color")
        return filter
    }()

    private let customColorChipFilter: NatChipFilter = {
        let filter = NatChipFilter(color: .custom(selectedColor: NatColors.link,
                                          labelColor: NatColors.lowEmphasis,
                                          borderColor: NatColors.alert))
        filter.configure(text: "Custom color")
        return filter
    }()

    private let chipFilterWithAction: NatChipFilter = {
        let filter = NatChipFilter()
        filter.configure(text: "Filter with action")
        return filter
    }()

    private let semiSizeChipFilter: NatChipFilter = {
        let filter = NatChipFilter(size: .semi)
        filter.configure(text: "Semi filter")
        return filter
    }()

    private let semiXSizeChipFilter: NatChipFilter = {
        let filter = NatChipFilter(size: .semiX)
        filter.configure(text: "SemiX size")
        return filter
    }()

    private let mediumSizeChipFilter: NatChipFilter = {
        let filter = NatChipFilter(size: .medium)
        filter.configure(text: "Medium size")
        return filter
    }()

    private let leftIconChipFilter: NatChipFilter = {
        let icon = getIcon(.outlinedDefaultMockup)
        let filter = NatChipFilter()
        filter.configure(text: "Left icon")
        filter.configure(icon: icon, position: .left)
        return filter
    }()

    private let rightIconChipFilter: NatChipFilter = {
        let icon = getIcon(.outlinedDefaultMockup)
        let filter = NatChipFilter()
        filter.configure(text: "Right icon")
        filter.configure(icon: icon, position: .right)
        return filter
    }()

    private let bothSidesIconChipFilter: NatChipFilter = {
        let icon = getIcon(.outlinedDefaultMockup)
        let filter = NatChipFilter()
        filter.configure(text: "Both sides icon")
        filter.configure(icon: icon, position: .left)
        filter.configure(icon: icon, position: .right)
        return filter
    }()

    private let leftAvatarChipFilter: NatChipFilter = {
        let avatar = NatAvatar(size: .standard, type: .label)
        avatar.configure(name: "Design System")
        let filter = NatChipFilter()
        filter.configure(text: "Left avatar")
        filter.configure(avatar: avatar, position: .left)
        return filter
    }()

    private let rightAvatarChipFilter: NatChipFilter = {
        let avatar = NatAvatar(size: .standard, type: .label)
        avatar.configure(name: "Design System")
        let filter = NatChipFilter()
        filter.configure(text: "Right avatar")
        filter.configure(avatar: avatar, position: .right)
        return filter
    }()

    private let iconAndAvatarChipFilter: NatChipFilter = {
        let icon = getIcon(.outlinedDefaultMockup)
        let avatar = NatAvatar(size: .standard, type: .label)
        avatar.configure(name: "Design System")
        let filter = NatChipFilter()
        filter.configure(text: "Icon and Avatar")
        filter.configure(icon: icon, position: .left)
        filter.configure(avatar: avatar, position: .right)
        return filter
    }()

    private let avatarAndIconChipFilter: NatChipFilter = {
        let icon = getIcon(.outlinedDefaultMockup)
        let avatar = NatAvatar(size: .standard, type: .label)
        avatar.configure(name: "Design System")
        let filter = NatChipFilter()
        filter.configure(text: "Avatar and icon")
        filter.configure(avatar: avatar, position: .left)
        filter.configure(icon: icon, position: .right)
        return filter
    }()

    private let focusedChipFilter: NatChipFilter = {
        let chipFilter = NatChipFilter()
        chipFilter.configure(text: "Focused")
        chipFilter.configure(state: .focused)
        return chipFilter
    }()

    private let disabledChipFilter: NatChipFilter = {
        let chipFilter = NatChipFilter()
        chipFilter.configure(text: "Disabled")
        chipFilter.configure(state: .disabled)
        return chipFilter
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
        stackView.addArrangedSubview(neutralColorChipFilter)
        stackView.addArrangedSubview(primaryColorChipFilter)
        stackView.addArrangedSubview(secondaryColorChipFilter)
        stackView.addArrangedSubview(customColorChipFilter)
        stackView.addArrangedSubview(chipFilterWithAction)
        stackView.addArrangedSubview(semiSizeChipFilter)
        stackView.addArrangedSubview(semiXSizeChipFilter)
        stackView.addArrangedSubview(mediumSizeChipFilter)
        stackView.addArrangedSubview(leftIconChipFilter)
        stackView.addArrangedSubview(rightIconChipFilter)
        stackView.addArrangedSubview(bothSidesIconChipFilter)
        stackView.addArrangedSubview(leftAvatarChipFilter)
        stackView.addArrangedSubview(rightAvatarChipFilter)
        stackView.addArrangedSubview(iconAndAvatarChipFilter)
        stackView.addArrangedSubview(avatarAndIconChipFilter)
        stackView.addArrangedSubview(focusedChipFilter)
        stackView.addArrangedSubview(disabledChipFilter)
        addConstraints()
    }

    private func setupHandlers() {
        filterWithAction.configure { isSelected in
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
