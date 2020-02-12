public class Divider: UIView {

    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.highlight.withAlphaComponent(0.12)
        return view
    }()

    public override init(frame: CGRect) {
        let dividerFrame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: 1)
        super.init(frame: dividerFrame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Divider {

    private func setup() {
        backgroundColor = .clear
        addLineView()
    }

    private func addLineView() {
        addSubview(lineView)
        lineView.translatesAutoresizingMaskIntoConstraints = false

        let constrains = [
            lineView.topAnchor.constraint(equalTo: topAnchor),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            lineView.heightAnchor.constraint(equalToConstant: frame.size.height)
        ]

        NSLayoutConstraint.activate(constrains)
    }
}
