//
//  GaYaTag.swift
//  GaYa DS
//
//  Created by Hayna.Cardoso on 12/11/24.
//  Copyright © 2024 Natura. All rights reserved.
//

import Foundation

public final class GaYaTag: UIView {
    typealias DrawPath = (_ size: CGSize) -> Void

    enum Position {
        case `default`
        case left
        case right
    }

    // MARK: - Private properties

    public lazy var iconView: IconView = {
        let iconView = IconView()
        iconView.translatesAutoresizingMaskIntoConstraints = false
        return iconView

    }()

    public lazy var label: UILabel = {
        let label = UILabel()
        let fontSize = getComponentAttributeFromTheme(\.tagLabelFontSize)
        let fontWeight = getComponentAttributeFromTheme(\.tagLabelPrimaryFontWeight)
        let fontFamily = getComponentAttributeFromTheme(\.tagLabelPrimaryFontFamily)

        label.font = GaYaFonts.font(ofSize: fontSize,
                                   withWeight: fontWeight,
                                   withFamily: fontFamily)

        label.textAlignment = .center
        label.setContentCompressionResistancePriority(.defaultHigh + 1, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var style: Style

    private var size: Size
    public var icon: String? {
        didSet {
            updateIcon()
        }
    }

    public var text: String? {
        didSet {
            updateText()
        }
    }
    
    public var color: ThemeColor {
        didSet {
            style.applyStyle(self)
            setNeedsDisplay()
        }
    }

    private var drawPath: DrawPath?
    private var heightConstraint: NSLayoutConstraint?

    public static var currentTheme: AvailableTheme = .none

    // MARK: - Inits

    public init(style: Style = .default,
                color: Color = .primary,
                size: Size = .small,
                icon: String? = nil,
                text: String? = nil,
                theme:AvailableTheme = .none) {
        self.style = style
        self.color = ThemeColor(theme: theme, colorType: color)
        self.size = size
        self.icon = icon
        self.text = text
        GaYaTag.currentTheme = theme

        super.init(frame: .zero)
        self.contentScaleFactor = UIScreen.main.scale
        
        style.applyStyle(self)

        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func setup() {
        backgroundColor = .clear
        if icon != nil {
            addSubview(iconView)
        }
        addSubview(label)
        addConstraints()
        updateText()
        updateIcon()
    }

    private func addConstraints() {
        translatesAutoresizingMaskIntoConstraints = false

        var constraints: [NSLayoutConstraint] = []

        if icon != nil {
            constraints = [
                iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: getTokenFromTheme(\.spacingTiny)),
                iconView.heightAnchor.constraint(equalToConstant: size.value),
                iconView.widthAnchor.constraint(equalToConstant: size.value),
                iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
                label.leadingAnchor.constraint(equalTo: iconView.trailingAnchor,
                                               constant: getTokenFromTheme(\.spacingMicro)),
                label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -getTokenFromTheme(\.spacingTiny)),
                label.centerYAnchor.constraint(equalTo: centerYAnchor)
            ]
        } else {
            constraints = [
                label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -getTokenFromTheme(\.sizeTiny)),
                label.topAnchor.constraint(equalTo: topAnchor, constant: getTokenFromTheme(\.sizeNone)),
                label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -getTokenFromTheme(\.sizeNone)),
                label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: getTokenFromTheme(\.sizeTiny))
            ]
        }

        heightConstraint = heightAnchor.constraint(equalToConstant: size.value)
        if let heightConstraint = heightConstraint {
            constraints.append(heightConstraint)
        }
        NSLayoutConstraint.activate(constraints)
    }

    func configure(path color: UIColor, position: Position) {
        drawPath = { size in
            let path: UIBezierPath

            switch position {
            case .default:
                path = UIBezierPath(roundedRect: CGRect(origin: .zero, size: size),
                                    cornerRadius: GaYaSizes.radiusCircle(viewHeight: size.height))
            case .left:
                path = UIBezierPath(roundedRect: CGRect(origin: .zero, size: size),
                                    byRoundingCorners: [.topRight, .bottomRight],
                                    cornerRadii: CGSize(width: GaYaSizes.radiusCircle(viewHeight: size.height),
                                                        height: GaYaSizes.radiusCircle(viewHeight: size.height)))
            case .right:
                path = UIBezierPath(roundedRect: CGRect(origin: .zero, size: size),
                                    byRoundingCorners: [.topLeft, .bottomLeft],
                                    cornerRadii: CGSize(width: GaYaSizes.radiusCircle(viewHeight: size.height),
                                                        height: GaYaSizes.radiusCircle(viewHeight: size.height)))
            }

            self.color.tag.set()
            path.fill()
        }
    }

    func updateText() {
        guard let text = text else { return }
        label.attributedText = text.attributedStringWith(lineHeight: getComponentAttributeFromTheme(\.tagLabelLineHeight),
                                                         letterSpacing: getComponentAttributeFromTheme(\.tagLabelLetterSpacing))
        label.textAlignment = .center
        isHidden = text.isEmpty
    }

    func updateIcon() {
        iconView.iconText = icon
        iconView.setFontSize(size: size.iconSize)
    }

    func configure(textColor color: UIColor) {
        label.textColor = color
    }

    func configure(iconColor color: UIColor) {
        iconView.tintColor = color
    }

    // MARK: - Public methods

    override public func draw(_ rect: CGRect) {
        drawPath?(bounds.size)
    }

    /// Configures a text for the component's label. The tag adjusts its width to match the text length.
    public func configure(text: String?) {
        self.text = text
    }

    /// Configures a size to the component, which changes the tag's height and padding.
    public func configure(size: Size) {
        heightConstraint?.constant = size.value
        setNeedsDisplay()
    }

    /// Configures a color for the component's background.
    public func configure(color: Color) {
            switch color {
            case .primary:
                self.color = ThemeColor(theme: GaYaTag.currentTheme, colorType: .primary)
            case .secondary:
                self.color = ThemeColor(theme: GaYaTag.currentTheme, colorType: .secondary)
            default:
                self.color = ThemeColor(theme: .none, colorType: color)
            }
        }

    public func configure(icon: String?) {
        iconView.iconText = icon
    }
}
