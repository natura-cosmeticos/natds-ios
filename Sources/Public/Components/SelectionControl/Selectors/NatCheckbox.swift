import UIKit

public final class NatCheckbox: UIView {

    public var checkbox = NatSelectionControl(style: .checkbox)

    // MARK: - Inits
    public init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(checkbox)
        addConstraints()
    }

    private func addConstraints() {
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkbox.topAnchor.constraint(equalTo: topAnchor),
            checkbox.bottomAnchor.constraint(equalTo: bottomAnchor),
            checkbox.leadingAnchor.constraint(equalTo: leadingAnchor),
            checkbox.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    public func configure(text: String?) {
        checkbox.configure(text: text)
    }

    public func configure(isSelected: Bool) {
        checkbox.isSelected = isSelected
    }

    public func configure(isEnabled: Bool) {
        checkbox.isEnabled = isEnabled
    }

    public func configure(isIndeterminate: Bool) {
        checkbox.isIndeterminate = isIndeterminate
    }
}

//
//class CheckboxVitor: UIView {
//
//    NatChecboxControl
//
//
//
//    isselected: Bool = false {
//
//    didSet {
//
//    natcheckbox.isselected = isselected
//
//    }
//
//    }
//
//
//
//    init()
//
//
//
//    setup()
//
//    addsubview(natcheckbox)
//
//    addconstrints()
//
//
//
//    public configure(text: String?) {
//
//        natcheckboxcontrol.configure(text: text)
//
//    }
//
//
//
//    public func configure(isSelected: Bool) {
//
//        natcheckbox.isselected = isselected
//
//    }
//
//
//
//    button.isEnabled
//
//
//
//}
