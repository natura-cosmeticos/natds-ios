import Foundation

public class NatSelectionControl: UIView {

    private let style: Style

    public init(style: Style) {
        self.style = style
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        self.backgroundColor = .red

        let selectorView = style.getSelectorView()
        addSubview(selectorView)

        selectorView.translatesAutoresizingMaskIntoConstraints = false
        selectorView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        selectorView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        selectorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        selectorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        selectorView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        selectorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
}
