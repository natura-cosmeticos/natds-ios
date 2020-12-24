import Foundation

public class NatSelectionControl: UIView {

    private let style: Style
    private var text: String?

    private lazy var selectorView: UIControl = {
        let view = style.getSelector()
        return view
    }()

    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .body2, withWeight: .regular)
        label.text = text
        return label
    }()

    public init(style: Style, text: String?) {
        self.style = style
        self.text = text
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(selectorView)
        addSelectorConstraints()

        addSubview(label)
        addLabelConstraints()
    }

    private func addSelectorConstraints() {
        selectorView.translatesAutoresizingMaskIntoConstraints = false
        selectorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4).isActive = true
        selectorView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        selectorView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }

    private func addLabelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: selectorView.trailingAnchor, constant: 8).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: selectorView.centerYAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
}