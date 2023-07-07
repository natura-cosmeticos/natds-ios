final class DialogFooterView: UIView {

    // MARK: - Private properties
    private let sideMargins = getTokenFromTheme(\.sizeSmall)

    private let container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = getTokenFromTheme(\.sizeTiny)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private let notificationCenter: NotificationCenterObservable

    private var actions: [UIButton: ActionHandler] = [:]
    private var isFirstTimeInLayoutSubviews = true

    // MARK: - Inits

    init(notificationCenter: NotificationCenterObservable = NotificationCenter.default) {
        self.notificationCenter = notificationCenter

        super.init(frame: .zero)

        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Inits

    deinit {
        notificationCenter.removeObserver(self)
    }

    // MARK: - Overrides

    override func layoutSubviews() {
        super.layoutSubviews()

        if isFirstTimeInLayoutSubviews {
            adjustButtonsToFitScreen()
            isFirstTimeInLayoutSubviews = false
        }
    }

    // MARK: - Action handlers

    @objc private func buttonTapHandler(_ sender: UIButton) {
        actions[sender]?()
    }

    // MARK: - Public methods

    func configure(newButton configuration: DialogButtonConfiguration) {
        let button = NatButton(style: configuration.style, theme: configuration.theme)
        button.configure(title: configuration.title)
        button.addTarget(self, action: #selector(buttonTapHandler), for: .touchUpInside)
        addConstraintAndSuperView(button: button)

        actions[button] = configuration.action
    }

    // MARK: - Private methods

    private func addConstraintAndSuperView(button: NatButton) {
        button.translatesAutoresizingMaskIntoConstraints = false

        stackView.insertArrangedSubview(button, at: 0)

        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: NatButton.Height.medium)
        ])
    }

    private func setup() {
        notificationCenter.addObserver(
            self,
            selector: #selector(adjustButtonsToFitScreen),
            name: UIDevice.orientationDidChangeNotification,
            object: nil
        )

        addSubview(stackView)
        addConstraints()
    }

    @objc private func adjustButtonsToFitScreen() {
        let totalWidth = frame.width - (2 * sideMargins)
        stackView.axis = stackView.frame.width >= totalWidth ? .vertical : .horizontal
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -sideMargins),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: sideMargins)
        ])
    }
}
