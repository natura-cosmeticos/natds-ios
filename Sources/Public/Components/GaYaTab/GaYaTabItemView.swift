//
//  GaYaTabItemView.swift
//  NatDS
//
//  Created by Hayna.Cardoso on 27/03/25.
//  Copyright © 2025 Natura. All rights reserved.
//

protocol GaYaTabItemViewDelegate: AnyObject {
  func didTapTabItem(_ tabItemView: GaYaTabItemView)
}

public class GaYaTabItemView: UIView {
  
  enum State {
    case selected
    case normal
  }
  
  public enum ContentStyle {
    case textOnly
    case iconLeft(icon: String)
    case iconTop(icon: String)
    case iconOnly(icon: String)
  }
  
  weak var delegate: GaYaTabItemViewDelegate?
  
  var state: State = .normal {
    didSet {
      handleState()
    }
  }
  
  var contentStyle: ContentStyle = .textOnly {
    didSet {
      configureContentStyle()
    }
  }
  
  private var titleText: String = ""
  
  private lazy var iconView: IconView = {
    let view = IconView(fontSize: GaYaSizes.standard)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.tintColor = GaYaColors.highlight
    return view
  }()
  
  
  private func configureContentStyle() {
    titleLabel.removeFromSuperview()
    iconView.removeFromSuperview()
    subviews.forEach { if $0 is UIStackView { $0.removeFromSuperview() } }
    
    applyTitleAttributes()
    titleLabel.textColor = state == .selected ? GaYaColors.highlight : GaYaColors.mediumEmphasis
    titleLabel.textAlignment = .center
    titleLabel.numberOfLines = 1
    titleLabel.setContentHuggingPriority(.required, for: .vertical)
    titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
    
    iconView.setContentHuggingPriority(.required, for: .vertical)
    iconView.setContentCompressionResistancePriority(.required, for: .vertical)
    
    switch contentStyle {
    case .textOnly:
      
      let container = UIStackView(arrangedSubviews: [titleLabel])
      container.axis = .vertical
      container.alignment = .center
      container.translatesAutoresizingMaskIntoConstraints = false
      addSubview(container)
      
      NSLayoutConstraint.activate([
        container.centerYAnchor.constraint(equalTo: centerYAnchor),
        container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
        container.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
      ])
      
    case .iconLeft(let icon):
      iconView.iconText = icon
      
      titleLabel.attributedText = titleText.uppercased().attributedStringWith(
        lineHeight: getComponentAttributeFromTheme(\.tabLabelLineHeight),
        letterSpacing: getComponentAttributeFromTheme(\.tabLabelLetterSpacing)
      )
      titleLabel.textColor = state == .selected ? GaYaColors.highlight : GaYaColors.mediumEmphasis
      titleLabel.textAlignment = .center
      titleLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
      titleLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
      
      iconView.setContentHuggingPriority(.required, for: .horizontal)
      iconView.setContentCompressionResistancePriority(.required, for: .horizontal)
      
      let horizontalStack = UIStackView(arrangedSubviews: [iconView, titleLabel])
      horizontalStack.axis = .horizontal
      horizontalStack.spacing = 4
      horizontalStack.alignment = .center
      horizontalStack.translatesAutoresizingMaskIntoConstraints = false
      addSubview(horizontalStack)
      
      NSLayoutConstraint.activate([
        horizontalStack.centerXAnchor.constraint(equalTo: centerXAnchor),
        horizontalStack.centerYAnchor.constraint(equalTo: centerYAnchor),
        horizontalStack.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: GaYaDimensions.spacingTiny),
        horizontalStack.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -GaYaDimensions.spacingTiny),
        
        iconView.widthAnchor.constraint(equalToConstant: 20),
        iconView.heightAnchor.constraint(equalToConstant: 20)
      ])
      
      
    case .iconTop(let icon):
      
      iconView.iconText = icon
      
      titleLabel.attributedText = titleText.uppercased().attributedStringWith(
        lineHeight: getComponentAttributeFromTheme(\.tabLabelLineHeight),
        letterSpacing: getComponentAttributeFromTheme(\.tabLabelLetterSpacing)
      )
      titleLabel.textColor = state == .selected ? GaYaColors.highlight : GaYaColors.mediumEmphasis
      titleLabel.textAlignment = .center
      titleLabel.numberOfLines = 1
      titleLabel.setContentHuggingPriority(.required, for: .vertical)
      titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
      
      applyTitleAttributes()
      
      iconView.setContentHuggingPriority(.required, for: .vertical)
      iconView.setContentCompressionResistancePriority(.required, for: .vertical)
      
      let verticalStack = UIStackView(arrangedSubviews: [iconView, titleLabel])
      verticalStack.axis = .vertical
      verticalStack.alignment = .center
      verticalStack.spacing = GaYaDimensions.spacingMicro
      verticalStack.translatesAutoresizingMaskIntoConstraints = false
      addSubview(verticalStack)
      
      NSLayoutConstraint.activate([
        verticalStack.topAnchor.constraint(equalTo: topAnchor, constant: GaYaDimensions.spacingMicro),
        verticalStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -GaYaDimensions.spacingMicro),
        verticalStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: GaYaDimensions.spacingTiny),
        verticalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -GaYaDimensions.spacingTiny),
        
        iconView.widthAnchor.constraint(equalToConstant: 20),
        iconView.heightAnchor.constraint(equalToConstant: 20)
      ])
      
    case .iconOnly(let icon):
      iconView.iconText = icon
      addSubview(iconView)
      
      NSLayoutConstraint.activate([
        iconView.centerXAnchor.constraint(equalTo: centerXAnchor),
        iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
        iconView.widthAnchor.constraint(equalToConstant: 24),
        iconView.heightAnchor.constraint(equalToConstant: 24)
      ])
    }
  }
  
  
  private(set) lazy var titleLabel: UILabel = {
    let label = UILabel()
    let fontSize = getComponentAttributeFromTheme(\.tabLabelFontSize)
    let fontWeight = getComponentAttributeFromTheme(\.tabLabelPrimaryFontWeight)
    let fontFamily = getComponentAttributeFromTheme(\.tabLabelPrimaryFontFamily)
    
    label.font = GaYaFonts.font(ofSize: fontSize,
                                withWeight: fontWeight,
                                withFamily: fontFamily)
    label.textAlignment = .center
    return label
  }()
  
  init(title: String) {
    super.init(frame: .zero)
    self.titleText = title
    setup()
  }
  
  private func applyTitleAttributes() {
    titleLabel.attributedText = titleText.uppercased().attributedStringWith(
      lineHeight: getComponentAttributeFromTheme(\.tabLabelLineHeight),
      letterSpacing: getComponentAttributeFromTheme(\.tabLabelLetterSpacing)
    )
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension GaYaTabItemView {
  
  private func setup() {
    backgroundColor = .clear
    
    addLabel()
    handleState()
    
    let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
    self.addGestureRecognizer(gesture)
  }
  
  private func addLabel() {
    addSubview(titleLabel)
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: GaYaDimensions.spacingTiny),
      titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
      titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -GaYaDimensions.spacingTiny),
      self.widthAnchor.constraint(greaterThanOrEqualToConstant: GaYaDimensions.spacingXLarge)
    ])
  }
}

extension GaYaTabItemView {
  
  @objc func handleTap() {
    delegate?.didTapTabItem(self)
  }
  
  private func handleState() {
    switch state {
    case .normal:
      titleLabel.textColor = GaYaColors.mediumEmphasis
    case .selected:
      titleLabel.textColor = GaYaColors.highlight
    }
  }
}
