//
//  GaYaButtonViewController.swift
//  NatDS-SampleApp
//
//  Created by Hayna.Cardoso on 26/04/24.
//  Copyright © 2024 Natura. All rights reserved.
//

import Foundation
import NatDS

final class GaYaButtonViewController: UIViewController, SampleItem {
    static var name = "GaYaButton"

    // MARK: - Private properties

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceHorizontal = false
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()

    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = NatSpacing.small
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let labelFilled: UILabel = {
        let label = UILabel()
        label.text = " Filled"
        label.textColor = NatColors.highEmphasis
        label.font = NatFonts.font(ofSize: .heading5, withWeight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private let labelOutlined: UILabel = {
        let label = UILabel()
        label.text = " Outlined"
        label.textColor = NatColors.highEmphasis
        label.font = NatFonts.font(ofSize: .heading5, withWeight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private let labelGhost: UILabel = {
        let label = UILabel()
        label.text = " Ghost"
        label.textColor = NatColors.highEmphasis
        label.font = NatFonts.font(ofSize: .heading5, withWeight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private let labelTonal: UILabel = {
        let label = UILabel()
        label.text = " Tonal"
        label.textColor = NatColors.highEmphasis
        label.font = NatFonts.font(ofSize: .heading5, withWeight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private let labelDisabled: UILabel = {
        let label = UILabel()
        label.text = " Disabled"
        label.textColor = NatColors.highEmphasis
        label.font = NatFonts.font(ofSize: .heading5, withWeight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private let labelDisplay: UILabel = {
        let label = UILabel()
        label.text = " Display - implemented by dev"
        label.textColor = NatColors.highEmphasis
        label.font = NatFonts.font(ofSize: .heading5, withWeight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private let labelIcons: UILabel = {
        let label = UILabel()
        label.text = " Icons"
        label.textColor = NatColors.highEmphasis
        label.font = NatFonts.font(ofSize: .heading5, withWeight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private let labelSizes: UILabel = {
        let label = UILabel()
        label.text = " Sizes"
        label.textColor = NatColors.highEmphasis
        label.font = NatFonts.font(ofSize: .heading5, withWeight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private let filled1: GaYaButton = {
        let button = GaYaButton(style: .filled, color: .primary)
        button.configure(title: "primary")
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let filled2: GaYaButton = {
        let button = GaYaButton(style: .filled, color: .onPrimary)
        button.configure(title: "onPrimary")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let filled3: GaYaButton = {
        let button = GaYaButton(style: .filled, color: .secondary)
        button.configure(title: "secondary")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private let filled4: GaYaButton = {
        let button = GaYaButton(style: .filled, color: .onSecondary)
        button.configure(title: "onSecondary")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private let filled5: GaYaButton = {
        let button = GaYaButton(style: .filled, color: .inverse)
        button.configure(title: "inverse")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private let filled6: GaYaButton = {
        let button = GaYaButton(style: .filled, color: .neutral)
        button.configure(title: "neutral")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private let outlined1: GaYaButton = {
        let button = GaYaButton(style: .outlined, color: .primary)
        button.configure(title: "primary")
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let outlined2: GaYaButton = {
        let button = GaYaButton(style: .outlined, color: .onPrimary)
        button.configure(title: "onPrimary")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let outlined3: GaYaButton = {
        let button = GaYaButton(style: .outlined, color: .secondary)
        button.configure(title: "secondary")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private let outlined4: GaYaButton = {
        let button = GaYaButton(style: .outlined, color: .onSecondary)
        button.configure(title: "onSecondary")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private let outlined5: GaYaButton = {
        let button = GaYaButton(style: .outlined, color: .inverse)
        button.configure(title: "inverse")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private let outlined6: GaYaButton = {
        let button = GaYaButton(style: .outlined, color: .neutral)
        button.configure(title: "neutral")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private let ghost1: GaYaButton = {
        let button = GaYaButton(style: .ghost, color: .primary)
        button.configure(title: "primary")
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let ghost2: GaYaButton = {
        let button = GaYaButton(style: .ghost, color: .onPrimary)
        button.configure(title: "onPrimary")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let ghost3: GaYaButton = {
        let button = GaYaButton(style: .ghost, color: .secondary)
        button.configure(title: "secondary")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private let ghost4: GaYaButton = {
        let button = GaYaButton(style: .ghost, color: .onSecondary)
        button.configure(title: "onSecondary")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private let ghost5: GaYaButton = {
        let button = GaYaButton(style: .ghost, color: .inverse)
        button.configure(title: "inverse")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private let ghost6: GaYaButton = {
        let button = GaYaButton(style: .ghost, color: .neutral)
        button.configure(title: "neutral")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private let tonal1: GaYaButton = {
        let button = GaYaButton(style: .tonal, color: .primary)
        button.configure(title: "primary")
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let tonal2: GaYaButton = {
        let button = GaYaButton(style: .tonal, color: .onPrimary)
        button.configure(title: "onPrimary")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let tonal3: GaYaButton = {
        let button = GaYaButton(style: .tonal, color: .secondary)
        button.configure(title: "secondary")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private let tonal4: GaYaButton = {
        let button = GaYaButton(style: .tonal, color: .onSecondary)
        button.configure(title: "onSecondary")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private let tonal5: GaYaButton = {
        let button = GaYaButton(style: .tonal, color: .inverse)
        button.configure(title: "inverse")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private let tonal6: GaYaButton = {
        let button = GaYaButton(style: .tonal, color: .neutral)
        button.configure(title: "neutral")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let filledStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()
    
    private let filledStackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()
    
    private let outlinedStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()
    
    private let outlinedStackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()
    
    private let ghostStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()
    
    private let ghostStackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()
    
    private let tonalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()
    
    private let tonalStackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()
    
    @objc func buttonClicked() {
        let snackbar = NatSnackbar(color: .inverse)
        snackbar.configure(duration: .long)
        snackbar.configure(position: .bottom)
        snackbar.configure(icon: getIcon(.outlinedAlertCheck))
        snackbar.configure(title: "This is my title")
        snackbar.show()
    }

    private let disabledStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private let disableContainedButton: GaYaButton = {
        let button = GaYaButton(style: .filled)
        button.configure(title: "Filled")
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let disableOutlinedButton: GaYaButton = {
        let button = GaYaButton(style: .outlined)
        button.configure(title: "Outlined")
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let disableTextButton: GaYaButton = {
        let button = GaYaButton(style: .ghost)
        button.configure(title: "ghost")
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private let disableTonalButton: GaYaButton = {
        let button = GaYaButton(style: .ghost)
        button.configure(title: "tonal")
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let fullStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = NatSpacing.tiny
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()
    
    private let containedFullMediumButton: GaYaButton = {
        let button = GaYaButton(style: .filled, size: .medium)
        button.configure(title: "Filled - Medium")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let disableContainedFullSemixButton: GaYaButton = {
        let button = GaYaButton(style: .filled, size: .semix)
        button.configure(title: "Filled - Semix")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let outlinedFullSemiButton: GaYaButton = {
        let button = GaYaButton(style: .filled, size: .semi)
        button.configure(title: "Filled - Semi")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let containedFullButton: GaYaButton = {
        let button = GaYaButton(style: .filled)
        button.configure(title: "filled full")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let outlinedFullButton: GaYaButton = {
        let button = GaYaButton(style: .outlined)
        button.configure(title: "Outlined full")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let textFullButton: GaYaButton = {
        let button = GaYaButton(style: .ghost)
        button.configure(title: "ghost full")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private let tonalFullButton: GaYaButton = {
        let button = GaYaButton(style: .tonal)
        button.configure(title: "tonal full")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let containedIconStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private let outlinedIconStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private let containedIconRightButton: GaYaButton = {
        let button = GaYaButton(style: .filled)
        button.configure(title: "filled")
        button.configure(icon: getIcon(.outlinedAlertNotification), position: .right)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let containedIconLeftButton: GaYaButton = {
        let button = GaYaButton(style: .outlined)
        button.configure(title: "outlined")
        button.configure(icon: nil, position: .left)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let outlinedIconRightButton: GaYaButton = {
        let button = GaYaButton(style: .ghost)
        button.configure(title: "ghost")
        button.configure(icon: nil, position: .right)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let outlinedIconLeftButton: GaYaButton = {
        let button = GaYaButton(style: .tonal)
        button.configure(title: "tonal")
        button.configure(icon: nil, position: .left)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    // MARK: - Private methods
    
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

    private func setup() {
        title = Self.name

        view.backgroundColor = hexStringToUIColor(hex: "#f4f4f4")
        view.addSubview(scrollView)

        scrollView.addSubview(containerView)
        containerView.addSubview(stackView)

        stackView.addArrangedSubview(labelFilled)
        stackView.addArrangedSubview(filledStackView)
        stackView.addArrangedSubview(filledStackView2)
        stackView.addArrangedSubview(labelOutlined)
        stackView.addArrangedSubview(outlinedStackView)
        stackView.addArrangedSubview(outlinedStackView2)
        stackView.addArrangedSubview(labelGhost)
        stackView.addArrangedSubview(ghostStackView)
        stackView.addArrangedSubview(ghostStackView2)
        stackView.addArrangedSubview(labelTonal)
        stackView.addArrangedSubview(tonalStackView)
        stackView.addArrangedSubview(tonalStackView2)
        stackView.addArrangedSubview(labelDisabled)
        stackView.addArrangedSubview(disabledStackView)
        stackView.addArrangedSubview(disabledStackView)
        stackView.addArrangedSubview(labelDisplay)
        stackView.addArrangedSubview(fullStackView)
        stackView.addArrangedSubview(labelIcons)
        stackView.addArrangedSubview(containedIconStackView)
        stackView.addArrangedSubview(outlinedIconStackView)
        stackView.addArrangedSubview(labelSizes)
        stackView.addArrangedSubview(containedFullMediumButton)
        stackView.addArrangedSubview(outlinedFullSemiButton)
        stackView.addArrangedSubview(disableContainedFullSemixButton)

        filledStackView.addArrangedSubview(filled1)
        filledStackView.addArrangedSubview(filled2)
        filledStackView.addArrangedSubview(filled3)
        
        filledStackView2.addArrangedSubview(filled4)
        filledStackView2.addArrangedSubview(filled5)
        filledStackView2.addArrangedSubview(filled6)
        
        outlinedStackView.addArrangedSubview(outlined1)
        outlinedStackView.addArrangedSubview(outlined2)
        outlinedStackView.addArrangedSubview(outlined3)
        
        outlinedStackView2.addArrangedSubview(outlined4)
        outlinedStackView2.addArrangedSubview(outlined5)
        outlinedStackView2.addArrangedSubview(outlined6)
        
        ghostStackView.addArrangedSubview(ghost1)
        ghostStackView.addArrangedSubview(ghost2)
        ghostStackView.addArrangedSubview(ghost3)
        
        ghostStackView2.addArrangedSubview(ghost4)
        ghostStackView2.addArrangedSubview(ghost5)
        ghostStackView2.addArrangedSubview(ghost6)
        
        tonalStackView.addArrangedSubview(tonal1)
        tonalStackView.addArrangedSubview(tonal2)
        tonalStackView.addArrangedSubview(tonal3)
        
        tonalStackView2.addArrangedSubview(tonal4)
        tonalStackView2.addArrangedSubview(tonal5)
        tonalStackView2.addArrangedSubview(tonal6)

        disabledStackView.addArrangedSubview(disableContainedButton)
        disabledStackView.addArrangedSubview(disableOutlinedButton)
        disabledStackView.addArrangedSubview(disableTextButton)
        disabledStackView.addArrangedSubview(disableTonalButton)

        fullStackView.addArrangedSubview(containedFullButton)
        fullStackView.addArrangedSubview(outlinedFullButton)
        fullStackView.addArrangedSubview(textFullButton)
        fullStackView.addArrangedSubview(tonalFullButton)

        containedIconStackView.addArrangedSubview(containedIconRightButton)
        containedIconStackView.addArrangedSubview(containedIconLeftButton)
        
        outlinedIconStackView.addArrangedSubview(outlinedIconRightButton)
        outlinedIconStackView.addArrangedSubview(outlinedIconLeftButton)
        

        addConstraints()
    }

    private func addConstraints() {
        
        let containerHeightConstraint = containerView.centerYAnchor
            .constraint(equalTo: scrollView.centerYAnchor)
        containerHeightConstraint.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),

            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -NatSpacing.small),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: NatSpacing.small),
            containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            containerHeightConstraint,

            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: NatSpacing.small),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -NatSpacing.small)
        ])
        
        viewDidLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        let lastView : UIView! = stackView.subviews.last
        let height = lastView.frame.size.height
        let pos = lastView.frame.origin.y
        let sizeOfContent = height + pos + 80

        scrollView.contentSize.height = sizeOfContent
    }
}
