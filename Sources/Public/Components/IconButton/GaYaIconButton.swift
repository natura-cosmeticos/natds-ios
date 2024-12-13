//
//  GaYaIconButton.swift
//  NatDS
//
//  Created by Hayna.Cardoso on 26/11/24.
//  Copyright © 2024 Natura. All rights reserved.
//

import Foundation
import UIKit

public final class GaYaIconButton: UIButton, Pulsable {
    
    // MARK: - Private properties
    
    private let style: Style
    private let notificationCenter: NotificationCenterObservable
    private var iconView: IconView?
    private var theme: AvailableTheme
    private var size: Sizes
    private var color: GaYaIconButtonColor
    private let defaultIcon: String = "outlined-default-mockup"
    
    // MARK: - Public properties
    
    public override var isEnabled: Bool {
        didSet {
            self.isHighlighted = false
            style.changeState(self.theme, self.color, self)
            iconView?.tintColor = self.tintColor
        }
    }
    
    // MARK: - Inits
    
    public convenience init(style: Style, size: Sizes = .semix, theme: AvailableTheme = .none, color: GaYaIconButtonColor = .primary) {
        self.init(style: style, notificationCenter: NotificationCenter.default, size: size, theme: theme, color: color)
    }
    
    init(style: Style, notificationCenter: NotificationCenterObservable, size: Sizes = .semix, theme: AvailableTheme = .none, color: GaYaIconButtonColor = .primary) {
        self.style = style
        self.notificationCenter = notificationCenter
        self.theme = theme
        self.size = size
        self.color = color
        
        super.init(frame: .zero)
        
        configure(icon: defaultIcon)
        
        style.applyStyle(self.theme, self.color, self)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let sizeConstant: CGFloat
        switch size {
        case .medium:
            sizeConstant = getTokenFromTheme(\.sizeMedium)
        case .semix:
            sizeConstant = getTokenFromTheme(\.sizeSemiX)
        case .semi:
            sizeConstant = getTokenFromTheme(\.sizeSemi)
        }
        
        widthAnchor.constraint(equalToConstant: sizeConstant).isActive = true
        heightAnchor.constraint(equalToConstant: sizeConstant).isActive = true
        
        widthAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        self.layer.cornerRadius = sizeConstant / 2
        self.clipsToBounds = true
        
        setContentHuggingPriority(.required, for: .horizontal)
        setContentHuggingPriority(.required, for: .vertical)
        setContentCompressionResistancePriority(.required, for: .horizontal)
        setContentCompressionResistancePriority(.required, for: .vertical)
        
        applyDefaultIconSize(sizeConstant: sizeConstant)
    }
    
    private func applyDefaultIconSize(sizeConstant: CGFloat) {
        let iconSize = sizeConstant * 0.7
        iconView?.updateIconSize(to: CGSize(width: iconSize, height: iconSize))
    }
    
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        if let width = self.layer.bounds.size.width as CGFloat? {
            let iconSize = width * 0.7
            iconView?.updateIconSize(to: CGSize(width: iconSize, height: iconSize))
        }
        
        self.layer.cornerRadius = self.bounds.size.width / 2
        self.clipsToBounds = true
    }
    
    // MARK: - Deinit
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    
    public func configure(icon: String?) {
        iconView?.removeFromSuperview()
        
        let finalIcon = (icon?.isEmpty == false) ? icon : defaultIcon
        
        let view = createIconView(icon: finalIcon)
        addSubview(view)
        setupConstraints(for: view)
        
        iconView = view
    }
    
    // MARK: - Overrides
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        if let touch = touches.first {
            let point = touch.location(in: self)
            addPulseLayerAnimated(at: point,
                                  in: layer,
                                  removeAfterAnimation: false)
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        removePulseLayer(layer: layer)
    }
}

// MARK: - NotificationCenter

extension GaYaIconButton {
    @objc private func themeHasChanged() {
        style.changeState(self.theme, self.color, self)
        iconView?.tintColor = self.tintColor
    }
}

// MARK: - Configure IconView

extension GaYaIconButton {
    private func createIconView(icon: String?) -> IconView {
        let iconView = IconView(fontSize: GaYaSizes.standard)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.iconText = icon
        
        style.applyIconStyle(self.theme, self.color, self)
        iconView.tintColor = self.tintColor
        
        return iconView
    }
    
    private func setupConstraints(for iconView: IconView) {
        iconView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        iconView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
