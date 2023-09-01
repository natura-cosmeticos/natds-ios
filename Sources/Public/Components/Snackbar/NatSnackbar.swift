//
//  NatSnackbar.swift
//  NatDS
//
//  Created by Hayna.Cardoso on 01/09/23.
//  Copyright © 2023 Natura. All rights reserved.
//

import UIKit

public final class NatSnackbar: UIView {
    
    public enum SnackbarPosition {
        case top, bottom
    }

    public enum SnackbarDuration {
        case short, long, custom(seconds: Double)
        
        var value: Double {
            switch self {
            case .short:
                return 5.0
            case .long:
                return 10.0
            case .custom(let seconds):
                return seconds
            }
        }
    }
    
    public enum SnackbarColor {
        case inverse, success, error, warning, info
        case custom(backgroundColor: UIColor, labelsColor: UIColor)
        
        var backgroundColor: UIColor {
            switch self {
            case .inverse:
                return UIColor.darkGray
            case .success:
                return getUIColorFromTokens(\.colorSuccess)
            case .error:
                return getUIColorFromTokens(\.colorAlert)
            case .warning:
                return getUIColorFromTokens(\.colorWarning)
            case .info:
                return getUIColorFromTokens(\.colorLink)
            case .custom(let color, _):
                return color
            }
        }

        var labelColor: UIColor {
            switch self {
            case .success, .error, .warning, .info:
                return UIColor.black
            case .custom(_, let color):
                return color
            case .inverse:
                return UIColor.white
            }
        }
    }
    
    private var snackbarDuration: SnackbarDuration = .short
    private var snackbarPosition: SnackbarPosition = .bottom
    
    private var labelToIconConstraint: NSLayoutConstraint?
    private var labelToCardviewConstraint: NSLayoutConstraint?

    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .heading6, withWeight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var cardView: UIView!
    private var titleIconImageView: IconView?
    private var noTitleIconImageView: UIImageView!
    private var messageLabel: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .body1, withWeight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var actionButtonIcon: UIImageView!
    
    public func configure(icon: String?) {
        if let iconText = icon {
            if titleIconImageView == nil {
                titleIconImageView = createIconView(icon: iconText)
                cardView.addSubview(titleIconImageView!)
            } else {
                titleIconImageView?.iconText = iconText
                cardView.addSubview(titleIconImageView!)
            }
        } else {
            titleIconImageView?.removeFromSuperview()
            titleIconImageView = nil
        }
        
        setupConstraints()
    }

    
    public func configure(message: String?) {
        messageLabel.text = message
        messageLabel.isHidden = (message == nil || message?.isEmpty == true)
    }

    public init(color: SnackbarColor = .info) {
        super.init(frame: .zero)
        self.backgroundColor = color.backgroundColor
        self.titleLabel.textColor = color.labelColor
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
                
        cardView = UIView()
        cardView.backgroundColor = self.backgroundColor
        cardView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(cardView)
                
        noTitleIconImageView = UIImageView(image: UIImage(named: "default_icon_outlined_default_mockup"))
        noTitleIconImageView.tintColor = .white
        noTitleIconImageView.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(noTitleIconImageView)
        
        titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        cardView.addSubview(titleLabel)
                
        messageLabel = UILabel()
        messageLabel.textColor = .white
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(messageLabel)
                
        actionButtonIcon = UIImageView(image: UIImage(named: "default_icon_outlined_default_mockup"))
        actionButtonIcon.tintColor = .white
        actionButtonIcon.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(iconPressed))
        actionButtonIcon.addGestureRecognizer(tapGesture)
        actionButtonIcon.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(actionButtonIcon)
                
        setupConstraints()
    }
    
    private func setupConstraints() {
        let padding: CGFloat = NatSizes.standard

        titleIconImageView?.removeConstraints(titleIconImageView?.constraints ?? [])
        titleLabel.removeConstraints(titleLabel.constraints)
        cardView.removeConstraints(cardView.constraints)
        
        cardView.addSubview(titleLabel)
        if let titleIconImageView = titleIconImageView {
            cardView.addSubview(titleIconImageView)
        }
        
        if let titleIconImageView = titleIconImageView {
            NSLayoutConstraint.activate([
                titleIconImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: padding),
                titleIconImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
                titleIconImageView.widthAnchor.constraint(equalToConstant: NatSizes.semi),
                titleIconImageView.heightAnchor.constraint(equalToConstant: NatSizes.semi),
                
                titleLabel.leadingAnchor.constraint(equalTo: titleIconImageView.trailingAnchor, constant: 8),
                titleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -padding),
                titleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: padding),
                titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: messageLabel.topAnchor, constant: -8)
            ])
        } else {
            NSLayoutConstraint.activate([
                titleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: padding),
                titleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -padding),
                titleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: padding),
                titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: messageLabel.topAnchor, constant: -8)
            ])
        }

        NSLayoutConstraint.activate([
            messageLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: padding),
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            messageLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -padding),
            messageLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -padding),
            
            cardView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            cardView.topAnchor.constraint(equalTo: self.topAnchor),
            cardView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }


    
    private func createIconView(icon: String?) -> IconView {
        let iconView = IconView(fontSize: NatSizes.semi)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.iconText = icon
        iconView.tintColor = .white
        return iconView
    }


    public func configure(title: String?) {
        titleLabel.text = title
    }

    public func configure(duration: SnackbarDuration) {
        self.snackbarDuration = duration
    }

    public func configure(position: SnackbarPosition) {
        self.snackbarPosition = position
    }

    public func show() {
        guard let window = UIApplication.shared.keyWindow else { return }

        window.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false

        if #available(iOS 11, *) {
            switch snackbarPosition {
            case .top:
                NSLayoutConstraint.activate([
                    topAnchor.constraint(equalTo: window.safeAreaLayoutGuide.topAnchor, constant: 48),
                    leadingAnchor.constraint(equalTo: window.leadingAnchor, constant: 16),
                    trailingAnchor.constraint(equalTo: window.trailingAnchor, constant: -16)
                ])
            case .bottom:
                NSLayoutConstraint.activate([
                    bottomAnchor.constraint(equalTo: window.safeAreaLayoutGuide.bottomAnchor, constant: -48),
                    leadingAnchor.constraint(equalTo: window.leadingAnchor, constant: 16),
                    trailingAnchor.constraint(equalTo: window.trailingAnchor, constant: -16)
                ])
            }
        } else {
            switch snackbarPosition {
            case .top:
                NSLayoutConstraint.activate([
                    topAnchor.constraint(equalTo: window.topAnchor, constant: 20),
                    leadingAnchor.constraint(equalTo: window.leadingAnchor, constant: 16),
                    trailingAnchor.constraint(equalTo: window.trailingAnchor, constant: -16)
                ])
            case .bottom:
                NSLayoutConstraint.activate([
                    bottomAnchor.constraint(equalTo: window.bottomAnchor, constant: -20),
                    leadingAnchor.constraint(equalTo: window.leadingAnchor, constant: 16),
                    trailingAnchor.constraint(equalTo: window.trailingAnchor, constant: -16)
                ])
            }
        }
        
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true

        self.alpha = 0.0
        UIView.animate(withDuration: 0.3) {
            self.alpha = 1.0
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + snackbarDuration.value) {
            self.dismiss()
        }
    }



    private func dismiss() {
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0.0
        }) { _ in
            self.removeFromSuperview()
        }
    }

    @objc func buttonPressed() {
        // Handle button action
        print("Button pressed!")
    }

    @objc func iconPressed() {
        // Handle icon action
        print("Icon pressed!")
    }
}
