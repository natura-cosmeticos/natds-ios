/**
 Divider is a class that represents Divider component from the design system.
 It has a predetermined height and it's necessary to configure its width using constraints.
 
 The Divider componet has 3 styles:
 - full-bleed
 - middle
 - inset

Example of usage:
 
         divider.configure(style: .full-bleed)
         divider.configure(style: .middle)
         divider.configure(style: .inset)

 - Requires:
 It's necessary to configure the Design System with a theme or fatalError will be raised.

        DesignSystem().configure(with: AvailableTheme)
 */

public class Divider: UIView {

    private var dividerLine = UIView()

    public init() {
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods
    
    private func setup() {
        dividerLine.translatesAutoresizingMaskIntoConstraints = false
        dividerLine.backgroundColor = getUIColorFromTokens(\.colorLowEmphasis)
        addSubview(dividerLine)
        addConstraints()
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            dividerLine.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    // MARK: - Public methods
    
    /// Sets a style for the divider
    /// - Parameter style: an option from the available styles for divider
    public func configure(style: Styles) {
        addDividerStyle(style)
    }
    
    private func addDividerStyle(_ style: Styles) {
        let constraints = [
            dividerLine.topAnchor.constraint(equalTo: topAnchor),
            dividerLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: style.spaceRight),
            dividerLine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -style.spaceLeft)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
