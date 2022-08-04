import UIKit

/**
 NatAlert  is a class that represents the alert component from the design system.
 An alert displays a short, important message in a way that attracts the user’s attention without interrupting the user’s task
 
 Example of usage:

        natAlert.configure(titleText: "Title example")
        natAlert.configure(color: .systemRed)
        natAlert.configure(descriptionText: "Description of your alert")
        natAlert.configure(primaryButtonTitle: "Primary Button Title")
        natAlert.configure(secondaryButtonTitle: "Secondary Button Title")
        natAlert.configure(showIcon: false)
        natAlert.configure(getIcon(icon: .outlinedAlertNotification))
 
 - Requires:
 It's necessary to configure the Design System with a theme or fatalError will be raised.

        DesignSystem().configure(with: AvailableTheme)
 */

public final class NatAlert: UIView {
    
    public var primaryButtonTitle: String = "" {
        didSet {
            primaryButton.configure(title: primaryButtonTitle)
        }
    }
    public var secondaryButtonTitle: String = "" {
        didSet {
            secondaryButton.configure(title: secondaryButtonTitle)
        }
    }

    public var showTitle: Bool = true {
        didSet {
            titleLabel.isHidden = !showTitle
        }
    }

    public var titleText: String? {
        didSet {
            titleLabel.text = titleText
        }
    }
    
    public var descriptionText: String? {
        didSet {
            descriptionLabel.text = descriptionText
        }
    }
    
    // MARK: - Subviews
    
    private let iconView: IconView = {
        let icon = IconView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = NatFonts.font(ofSize: .heading6)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = NatFonts.font(ofSize: .body1)
        label.numberOfLines = 0
        return label
    }()
    
    public let primaryButton: NatButton = {
        let button = NatButton(style: .outlined)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public let secondaryButton: NatButton = {
        let button = NatButton(style: .outlined)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let textStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Lifecycle
    
    public init(style: AlertStyle = .info, type: AlertType = .contained) {
        super.init(frame: .zero)
        self.backgroundColor = style.selectedBackgroundColor
        
        switch type {
        case .contained:
            self.layer.borderColor = UIColor.clear.cgColor
        case .outlined:
            self.layer.borderColor = style.selectedBorderColor.cgColor
        }
        
        self.titleLabel.textColor = style.selectedLabelColor
        self.descriptionLabel.textColor = style.selectedLabelColor
        self.iconView.tintColor = style.selectedLabelColor
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods
    
    private func setup() {
        addSubview(iconView)
        addSubview(textStackView)
        textStackView.addArrangedSubview(titleLabel)
        textStackView.addArrangedSubview(descriptionLabel)
        textStackView.addArrangedSubview(buttonStackView)
        
        buttonStackView.addArrangedSubview(primaryButton)
        buttonStackView.addArrangedSubview(secondaryButton)
        buttonStackView.isHidden = true
        
        addConstraints()
        setupUI()
    }
    private func addConstraints() {
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            iconView.heightAnchor.constraint(equalToConstant: 24),
            iconView.widthAnchor.constraint(equalToConstant: 24),
            
            textStackView.topAnchor.constraint(equalTo: iconView.topAnchor),
            textStackView.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 8),
            textStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)

        ])
    }
    
    private func setupUI() {
        layer.borderWidth = 1;
        layer.cornerRadius = 4;
        
    }
    
    // MARK: - Public Methods

    /// Sets the title of the component.
    ///
    /// Example of usage:
    /// ```
    /// natAlert.configure(titleText: "Texto exemplo")
    /// ```
    /// - Parameter titleText: An `String` that changes the title of the component
    
    public func configure(titleText: String?) {
        self.titleText = titleText
    }
    
    /// Sets the text description of the component.
    ///
    /// Example of usage:
    /// ```
    /// natAlert.configure(descriptionText: "Texto exemplo")
    /// ```
    /// - Parameter descriptionText: An `String` that changes the description of the component
    
    public func configure(descriptionText: String?) {
        self.descriptionText = descriptionText
    }
    
    /// Sets the title for the primary button of the component.
    ///
    /// Example of usage:
    /// ```
    /// natAlert.configure(primaryButtonTitle: "Texto exemplo")
    /// ```
    /// - Parameter primaryButtonTitle: An `String` that changes the title of the primary button of the component
    
    public func configure(primaryButtonTitle: String) {
        self.primaryButtonTitle = primaryButtonTitle
        if !primaryButtonTitle.isEmpty {
            primaryButton.configure(title: primaryButtonTitle)
            buttonStackView.isHidden = false
            secondaryButton.isHidden = true
        }
        
    }
    
    /// Sets the title for the secondary button of the component.
    ///
    /// Example of usage:
    /// ```
    /// natAlert.configure(secondaryButtonTitle: "Texto exemplo")
    /// ```
    /// - Parameter secondaryButtonTitle: An `String` that changes the title of the secondary button of the component
    
    public func configure(secondaryButtonTitle: String) {
        self.secondaryButtonTitle = secondaryButtonTitle
        if !secondaryButtonTitle.isEmpty {
            secondaryButton.configure(title: secondaryButtonTitle)
            buttonStackView.isHidden = false
            secondaryButton.isHidden = false
            primaryButton.isHidden = primaryButtonTitle.isEmpty ? true : false
        }
    }
    
    /// Sets if the component should show an icon or not
    ///
    /// Example of usage:
    /// ```
    /// natAlert.configure(showIcon: false)
    /// ```
    /// - Parameter showIcon: A `Boolean` that changes if the component should show an icon or not
    
    public func configure(showIcon: Bool = true) {
        iconView.isHidden = !showIcon
        NSLayoutConstraint.activate([
            textStackView.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: showIcon ? 8 : -16)
        ])
    }
    
    /// Sets an icon for the alert
    ///
    /// Example of usage:
    /// ```
    /// natAlert.configure(icon: getIcon(icon: .outlinedAlertNotification))
    /// ```
    /// - Parameter icon: A `String` that sets an image for the icon
    
    public func configure(icon: String) {
        iconView.iconText = icon
    }

}
