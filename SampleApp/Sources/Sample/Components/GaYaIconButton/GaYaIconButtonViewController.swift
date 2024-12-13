//
//  GaYaIconButtonViewController.swift
//  NatDS-SampleApp
//
//  Created by Hayna.Cardoso on 12/12/24.
//  Copyright © 2024 Natura. All rights reserved.
//

import Foundation
import NatDS

final class GaYaIconButtonViewController: UIViewController, SampleItem {
    static var name = "GaYaIconButton"
    
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
        stackView.spacing = GaYaDimensions.spacingSmall
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let labelFilled: UILabel = {
        let label = UILabel()
        label.text = " Filled"
        label.textColor = GaYaColors.highEmphasis
        label.font = NatFonts.font(ofSize: .heading5, withWeight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let labelOutlined: UILabel = {
        let label = UILabel()
        label.text = " Outlined"
        label.textColor = GaYaColors.highEmphasis
        label.font = NatFonts.font(ofSize: .heading5, withWeight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let labelGhost: UILabel = {
        let label = UILabel()
        label.text = " Ghost"
        label.textColor = GaYaColors.highEmphasis
        label.font = NatFonts.font(ofSize: .heading5, withWeight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let labelTonal: UILabel = {
        let label = UILabel()
        label.text = " Tonal"
        label.textColor = GaYaColors.highEmphasis
        label.font = NatFonts.font(ofSize: .heading5, withWeight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let labelDisabled: UILabel = {
        let label = UILabel()
        label.text = " Disabled"
        label.textColor = GaYaColors.highEmphasis
        label.font = NatFonts.font(ofSize: .heading5, withWeight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let labelSizes: UILabel = {
        let label = UILabel()
        label.text = " Sizes"
        label.textColor = GaYaColors.highEmphasis
        label.font = NatFonts.font(ofSize: .heading5, withWeight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let filled1: GaYaIconButton = {
        let iconbutton = GaYaIconButton(style: .filled, color: .primary)
        iconbutton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconbutton.translatesAutoresizingMaskIntoConstraints = false
        
        return iconbutton
    }()
    
    private let filled2: GaYaIconButton = {
        let iconbutton = GaYaIconButton(style: .filled, color: .onPrimary)
        iconbutton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconbutton.translatesAutoresizingMaskIntoConstraints = false
        
        return iconbutton
    }()
    
    private let filled3: GaYaIconButton = {
        let iconbutton = GaYaIconButton(style: .filled, color: .secondary)
        iconbutton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconbutton.translatesAutoresizingMaskIntoConstraints = false
        
        return iconbutton
    }()
    
    private let filled4: GaYaIconButton = {
        let iconbutton = GaYaIconButton(style: .filled, color: .onSecondary)
        iconbutton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconbutton.translatesAutoresizingMaskIntoConstraints = false
        
        return iconbutton
    }()
    
    private let filled5: GaYaIconButton = {
        let iconbutton = GaYaIconButton(style: .filled, color: .neutral)
        iconbutton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconbutton.translatesAutoresizingMaskIntoConstraints = false
        
        return iconbutton
    }()
    
    private let filled6: GaYaIconButton = {
        let iconbutton = GaYaIconButton(style: .filled, color: .inverse)
        iconbutton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconbutton.translatesAutoresizingMaskIntoConstraints = false
        
        return iconbutton
    }()
    
    private let outlined1: GaYaIconButton = {
        let iconbutton = GaYaIconButton(style: .outlined, color: .primary)
        iconbutton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconbutton.translatesAutoresizingMaskIntoConstraints = false
        
        return iconbutton
    }()
    
    private let outlined2: GaYaIconButton = {
        let iconbutton = GaYaIconButton(style: .outlined, color: .onPrimary)
        iconbutton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconbutton.translatesAutoresizingMaskIntoConstraints = false
        
        return iconbutton
    }()
    
    private let outlined3: GaYaIconButton = {
        let iconbutton = GaYaIconButton(style: .outlined, color: .secondary)
        iconbutton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconbutton.translatesAutoresizingMaskIntoConstraints = false
        
        return iconbutton
    }()
    
    private let outlined4: GaYaIconButton = {
        let iconbutton = GaYaIconButton(style: .outlined, color: .onSecondary)
        iconbutton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconbutton.translatesAutoresizingMaskIntoConstraints = false
        
        return iconbutton
    }()
    
    private let outlined5: GaYaIconButton = {
        let iconbutton = GaYaIconButton(style: .outlined, color: .neutral)
        iconbutton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconbutton.translatesAutoresizingMaskIntoConstraints = false
        
        return iconbutton
    }()
    
    private let outlined6: GaYaIconButton = {
        let iconbutton = GaYaIconButton(style: .outlined, color: .inverse)
        iconbutton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconbutton.translatesAutoresizingMaskIntoConstraints = false
        
        return iconbutton
    }()
    
    private let ghost1: GaYaIconButton = {
        let iconbutton = GaYaIconButton(style: .ghost, color: .primary)
        iconbutton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconbutton.translatesAutoresizingMaskIntoConstraints = false
        
        return iconbutton
    }()
    
    private let ghost2: GaYaIconButton = {
        let iconbutton = GaYaIconButton(style: .ghost, color: .onPrimary)
        iconbutton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconbutton.translatesAutoresizingMaskIntoConstraints = false
        
        return iconbutton
    }()
    
    private let ghost3: GaYaIconButton = {
        let iconbutton = GaYaIconButton(style: .ghost, color: .secondary)
        iconbutton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconbutton.translatesAutoresizingMaskIntoConstraints = false
        
        return iconbutton
    }()
    
    private let ghost4: GaYaIconButton = {
        let iconbutton = GaYaIconButton(style: .ghost, color: .onSecondary)
        iconbutton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconbutton.translatesAutoresizingMaskIntoConstraints = false
        
        return iconbutton
    }()
    
    private let ghost5: GaYaIconButton = {
        let iconbutton = GaYaIconButton(style: .ghost, color: .neutral)
        iconbutton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconbutton.translatesAutoresizingMaskIntoConstraints = false
        
        return iconbutton
    }()
    
    private let ghost6: GaYaIconButton = {
        let iconbutton = GaYaIconButton(style: .ghost, color: .inverse)
        iconbutton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconbutton.translatesAutoresizingMaskIntoConstraints = false
        
        return iconbutton
    }()
    
    private let tonal1: GaYaIconButton = {
        let iconbutton = GaYaIconButton(style: .tonal, color: .primary)
        iconbutton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconbutton.translatesAutoresizingMaskIntoConstraints = false
        
        return iconbutton
    }()
    
    private let tonal2: GaYaIconButton = {
        let iconbutton = GaYaIconButton(style: .tonal, color: .onPrimary)
        iconbutton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconbutton.translatesAutoresizingMaskIntoConstraints = false
        
        return iconbutton
    }()
    
    private let tonal3: GaYaIconButton = {
        let iconbutton = GaYaIconButton(style: .tonal, color: .secondary)
        iconbutton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconbutton.translatesAutoresizingMaskIntoConstraints = false
        
        return iconbutton
    }()
    
    private let tonal4: GaYaIconButton = {
        let iconbutton = GaYaIconButton(style: .tonal, color: .onSecondary)
        iconbutton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconbutton.translatesAutoresizingMaskIntoConstraints = false
        
        return iconbutton
    }()
    
    private let tonal5: GaYaIconButton = {
        let iconbutton = GaYaIconButton(style: .tonal, color: .neutral)
        iconbutton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconbutton.translatesAutoresizingMaskIntoConstraints = false
        
        return iconbutton
    }()
    
    private let tonal6: GaYaIconButton = {
        let iconbutton = GaYaIconButton(style: .tonal, color: .inverse)
        iconbutton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconbutton.translatesAutoresizingMaskIntoConstraints = false
        
        return iconbutton
    }()
    
    private let filledStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = GaYaDimensions.spacingTiny
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let outlinedStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = GaYaDimensions.spacingTiny
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let ghostStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = GaYaDimensions.spacingTiny
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let tonalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = GaYaDimensions.spacingTiny
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
        stackView.spacing = GaYaDimensions.spacingTiny
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let disableContainedButton: GaYaIconButton = {
        let iconButton = GaYaIconButton(style: .filled)
        iconButton.isEnabled = false
        iconButton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        
        return iconButton
    }()
    
    private let disableOutlinedButton: GaYaIconButton = {
        let iconButton = GaYaIconButton(style: .outlined)
        iconButton.isEnabled = false
        iconButton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        
        return iconButton
    }()
    
    private let disableTextButton: GaYaIconButton = {
        let iconButton = GaYaIconButton(style: .ghost)
        iconButton.isEnabled = false
        iconButton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        
        return iconButton
    }()
    
    private let disableTonalButton: GaYaIconButton = {
        let iconButton = GaYaIconButton(style: .tonal)
        iconButton.isEnabled = false
        iconButton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        
        return iconButton
    }()
    
    private let containedFullMediumButton: GaYaIconButton = {
        let iconButton = GaYaIconButton(style: .filled, size: .medium)
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        return iconButton
    }()
    
    private let disableContainedFullSemixButton: GaYaIconButton = {
        let iconButton = GaYaIconButton(style: .filled, size: .semix)
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        return iconButton
    }()
    
    private let outlinedFullSemiButton: GaYaIconButton = {
        let iconButton = GaYaIconButton(style: .filled, size: .semi)
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        return iconButton
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
        stackView.addArrangedSubview(labelOutlined)
        stackView.addArrangedSubview(outlinedStackView)
        stackView.addArrangedSubview(labelGhost)
        stackView.addArrangedSubview(ghostStackView)
        stackView.addArrangedSubview(labelTonal)
        stackView.addArrangedSubview(tonalStackView)
        stackView.addArrangedSubview(labelDisabled)
        stackView.addArrangedSubview(disabledStackView)
        stackView.addArrangedSubview(disabledStackView)
        stackView.addArrangedSubview(labelSizes)
        stackView.addArrangedSubview(outlinedFullSemiButton)
        stackView.addArrangedSubview(disableContainedFullSemixButton)
        stackView.addArrangedSubview(containedFullMediumButton)
        
        filledStackView.addArrangedSubview(filled1)
        filledStackView.addArrangedSubview(filled2)
        filledStackView.addArrangedSubview(filled3)
        filledStackView.addArrangedSubview(filled4)
        filledStackView.addArrangedSubview(filled5)
        filledStackView.addArrangedSubview(filled6)
        
        outlinedStackView.addArrangedSubview(outlined1)
        outlinedStackView.addArrangedSubview(outlined2)
        outlinedStackView.addArrangedSubview(outlined3)
        outlinedStackView.addArrangedSubview(outlined4)
        outlinedStackView.addArrangedSubview(outlined5)
        outlinedStackView.addArrangedSubview(outlined6)
        
        ghostStackView.addArrangedSubview(ghost1)
        ghostStackView.addArrangedSubview(ghost2)
        ghostStackView.addArrangedSubview(ghost3)
        ghostStackView.addArrangedSubview(ghost4)
        ghostStackView.addArrangedSubview(ghost5)
        ghostStackView.addArrangedSubview(ghost6)
        
        tonalStackView.addArrangedSubview(tonal1)
        tonalStackView.addArrangedSubview(tonal2)
        tonalStackView.addArrangedSubview(tonal3)
        tonalStackView.addArrangedSubview(tonal4)
        tonalStackView.addArrangedSubview(tonal5)
        tonalStackView.addArrangedSubview(tonal6)
        
        disabledStackView.addArrangedSubview(disableContainedButton)
        disabledStackView.addArrangedSubview(disableOutlinedButton)
        disabledStackView.addArrangedSubview(disableTextButton)
        disabledStackView.addArrangedSubview(disableTonalButton)
        
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
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -GaYaDimensions.spacingSmall),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: GaYaDimensions.spacingSmall),
            containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            containerHeightConstraint,
            
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: GaYaDimensions.spacingSmall),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -GaYaDimensions.spacingSmall)
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
