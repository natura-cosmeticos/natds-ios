//
//  FilterViewController.swift
//  NatDS-SampleApp
//
//  Created by Hayna.Cardoso on 04/05/23.
//  Copyright © 2023 Natura. All rights reserved.
//

import NatDS
import UIKit
import NatDSIcons

class FilterViewController: UIViewController, SampleItem {
    static var name = "Filter"

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

    private let neutralColorFilter: NatFilter = {
        let filter = NatFilter()
        filter.configure(text: "Neutral color")
        return filter
    }()

    private let primaryColorFilter: NatFilter = {
        let filter = NatFilter(color: .primary)
        filter.configure(text: "Primary color")
        return filter
    }()

    private let secondaryColorFilter: NatFilter = {
        let filter = NatFilter(color: .secondary)
        filter.configure(text: "Secondary color")
        return filter
    }()

    private let customColorFilter: NatFilter = {
        let filter = NatFilter(color: .custom(selectedColor: NatColors.link,
                                          labelColor: NatColors.lowEmphasis,
                                          borderColor: NatColors.alert))
        filter.configure(text: "Custom color")
        return filter
    }()

    private let filterWithAction: NatFilter = {
        let filter = NatFilter()
        filter.configure(text: "Filter with action")
        return filter
    }()

    private let semiSizeFilter: NatFilter = {
        let filter = NatFilter(size: .semi)
        filter.configure(text: "Semi filter")
        return filter
    }()

    private let semiXSizeFilter: NatFilter = {
        let filter = NatFilter(size: .semiX)
        filter.configure(text: "SemiX size")
        return filter
    }()

    private let mediumSizeFilter: NatFilter = {
        let filter = NatFilter(size: .medium)
        filter.configure(text: "Medium size")
        return filter
    }()

    private let leftIconFilter: NatFilter = {
        let icon = getIcon(.outlinedDefaultMockup)
        let filter = NatFilter()
        filter.configure(text: "Left icon")
        filter.configure(icon: icon, position: .left)
        return filter
    }()

    private let rightIconFilter: NatFilter = {
        let icon = getIcon(.outlinedDefaultMockup)
        let filter = NatFilter()
        filter.configure(text: "Right icon")
        filter.configure(icon: icon, position: .right)
        return filter
    }()

    private let bothSidesIconFilter: NatFilter = {
        let icon = getIcon(.outlinedDefaultMockup)
        let filter = NatFilter()
        filter.configure(text: "Both sides icon")
        filter.configure(icon: icon, position: .left)
        filter.configure(icon: icon, position: .right)
        return filter
    }()

    private let leftAvatarFilter: NatFilter = {
        let avatar = NatAvatar(size: .standard, type: .label)
        avatar.configure(name: "Design System")
        let filter = NatFilter()
        filter.configure(text: "Left avatar")
        filter.configure(avatar: avatar, position: .left)
        return filter
    }()

    private let rightAvatarFilter: NatFilter = {
        let avatar = NatAvatar(size: .standard, type: .label)
        avatar.configure(name: "Design System")
        let filter = NatFilter()
        filter.configure(text: "Right avatar")
        filter.configure(avatar: avatar, position: .right)
        return filter
    }()

    private let iconAndAvatarFilter: NatFilter = {
        let icon = getIcon(.outlinedDefaultMockup)
        let avatar = NatAvatar(size: .standard, type: .label)
        avatar.configure(name: "Design System")
        let filter = NatFilter()
        filter.configure(text: "Icon and Avatar")
        filter.configure(icon: icon, position: .left)
        filter.configure(avatar: avatar, position: .right)
        return filter
    }()

    private let avatarAndIconFilter: NatFilter = {
        let icon = getIcon(.outlinedDefaultMockup)
        let avatar = NatAvatar(size: .standard, type: .label)
        avatar.configure(name: "Design System")
        let filter = NatFilter()
        filter.configure(text: "Avatar and icon")
        filter.configure(avatar: avatar, position: .left)
        filter.configure(icon: icon, position: .right)
        return filter
    }()

    private let focusedFilter: NatFilter = {
        let filter = NatFilter()
        filter.configure(text: "Focused")
        filter.configure(state: .focused)
        return filter
    }()

    private let disabledFilter: NatFilter = {
        let filter = NatFilter()
        filter.configure(text: "Disabled")
        filter.configure(state: .disabled)
        return filter
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
        stackView.addArrangedSubview(neutralColorFilter)
        stackView.addArrangedSubview(primaryColorFilter)
        stackView.addArrangedSubview(secondaryColorFilter)
        stackView.addArrangedSubview(customColorFilter)
        stackView.addArrangedSubview(filterWithAction)
        stackView.addArrangedSubview(semiSizeFilter)
        stackView.addArrangedSubview(semiXSizeFilter)
        stackView.addArrangedSubview(mediumSizeFilter)
        stackView.addArrangedSubview(leftIconFilter)
        stackView.addArrangedSubview(rightIconFilter)
        stackView.addArrangedSubview(bothSidesIconFilter)
        stackView.addArrangedSubview(leftAvatarFilter)
        stackView.addArrangedSubview(rightAvatarFilter)
        stackView.addArrangedSubview(iconAndAvatarFilter)
        stackView.addArrangedSubview(avatarAndIconFilter)
        stackView.addArrangedSubview(focusedFilter)
        stackView.addArrangedSubview(disabledFilter)
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
