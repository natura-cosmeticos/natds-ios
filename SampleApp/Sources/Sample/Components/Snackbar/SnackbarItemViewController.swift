import NatDS
import NatDSIcons

final class SnackbarItemViewController: UIViewController, SampleItem {
    static var name = "Snackbar"

    // MARK: - Private properties

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = NatSpacing.tiny
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var snackbarStandardButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "Standard")
        button.addTarget(self, action: #selector(showStandard), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var snackbarTitleButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "With Title")
        button.addTarget(self, action: #selector(showWithTitle), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var snackbarIconButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "With Icon")
        button.addTarget(self, action: #selector(showWithIcon), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let stackViewButtons: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var snackbarButtonButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "Inline")
        button.addTarget(self, action: #selector(showActionInline), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var snackbarIconButtonButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "Block")
        button.addTarget(self, action: #selector(showActionBlock), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var snackbarBlockButtonButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "Icon Button")
        button.addTarget(self, action: #selector(showActionIcon), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let stackViewFeedback1: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let stackViewFeedback2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var snackbarFeedbackSuccessButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "Success")
        button.addTarget(self, action: #selector(showFeedbackSuccess), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var snackbarFeedbackErrorButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "Error")
        button.addTarget(self, action: #selector(showFeedbackError), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var snackbarFeedbackWarningButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "Warning")
        button.addTarget(self, action: #selector(showFeedbackWarning), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var snackbarFeedbackInfoButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "Info")
        button.addTarget(self, action: #selector(showFeedbackInfo), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let stackViewPosition: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var snackbarPositionTopButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "Top Center")
        button.addTarget(self, action: #selector(showPositionTop), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var snackbarPositionBottomButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "Bottom Center")
        button.addTarget(self, action: #selector(showPositionBottom), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let stackViewTimer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var snackbarTimerMinimumButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "Minimum")
        button.addTarget(self, action: #selector(showTimerMinimum), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var snackbarTimerIntermediaryButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "Intermediary")
        button.addTarget(self, action: #selector(showTimerIntermediary), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var snackbarTimerIndeterminateButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "Indeterminate")
        button.addTarget(self, action: #selector(showTimerIndeterminate), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var snackbarTimerCustomButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "Custom")
        button.addTarget(self, action: #selector(showTimerCustom), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let stackViewAnimation1: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let stackViewAnimation2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var snackbarAnimateTopLeftButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "Top Left")
        button.addTarget(self, action: #selector(showAnimationTopLeft), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var snackbarAnimateTopCenterButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "Top Center")
        button.addTarget(self, action: #selector(showAnimationTopCenter), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var snackbarAnimateTopRightButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "Top Right")
        button.addTarget(self, action: #selector(showAnimationTopRight), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var snackbarAnimateBottomLeftButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "Bottom Left")
        button.addTarget(self, action: #selector(showAnimationBottomLeft), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var snackbarAnimateBottomCenterButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "Bottom Center")
        button.addTarget(self, action: #selector(showAnimationBottomCenter), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var snackbarAnimateBottomRightButton: NatButton = {
        let button = NatButton(style: .contained)
        button.configure(title: "Bottom Right")
        button.addTarget(self, action: #selector(showAnimationBottomRight), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Life cycle

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        title = Self.name

        setup()
    }

    // MARK: - Private methods

    private func setup() {
        view.backgroundColor = NatColors.background
        view.addSubview(scrollView)

        scrollView.addSubview(containerView)

        containerView.addSubview(stackView)

        stackView.addArrangedSubview(createLabel(text: "Snackbar"))
        stackView.addArrangedSubview(snackbarStandardButton)
        stackView.addArrangedSubview(snackbarTitleButton)
        stackView.addArrangedSubview(snackbarIconButton)
        stackView.addArrangedSubview(createLabel(text: "Action buttons"))
        stackView.addArrangedSubview(stackViewButtons)
        stackView.addArrangedSubview(createLabel(text: "Feedback"))
        stackView.addArrangedSubview(stackViewFeedback1)
        stackView.addArrangedSubview(stackViewFeedback2)
        stackView.addArrangedSubview(createLabel(text: "Position"))
        stackView.addArrangedSubview(stackViewPosition)
        stackView.addArrangedSubview(createLabel(text: "Timer"))
        stackView.addArrangedSubview(stackViewTimer)
        stackView.addArrangedSubview(createLabel(text: "Animation"))
        stackView.addArrangedSubview(stackViewAnimation1)
        stackView.addArrangedSubview(stackViewAnimation2)

        stackViewButtons.addArrangedSubview(snackbarButtonButton)
        stackViewButtons.addArrangedSubview(snackbarIconButtonButton)
        stackViewButtons.addArrangedSubview(snackbarBlockButtonButton)

        stackViewFeedback1.addArrangedSubview(snackbarFeedbackSuccessButton)
        stackViewFeedback1.addArrangedSubview(snackbarFeedbackErrorButton)
        stackViewFeedback2.addArrangedSubview(snackbarFeedbackWarningButton)
        stackViewFeedback2.addArrangedSubview(snackbarFeedbackInfoButton)

        stackViewPosition.addArrangedSubview(snackbarPositionTopButton)
        stackViewPosition.addArrangedSubview(snackbarPositionBottomButton)

        stackViewTimer.addArrangedSubview(snackbarTimerMinimumButton)
        stackViewTimer.addArrangedSubview(snackbarTimerIntermediaryButton)
        stackViewTimer.addArrangedSubview(snackbarTimerIndeterminateButton)
        stackViewTimer.addArrangedSubview(snackbarTimerCustomButton)

        stackViewAnimation1.addArrangedSubview(snackbarAnimateTopLeftButton)
        stackViewAnimation1.addArrangedSubview(snackbarAnimateTopCenterButton)
        stackViewAnimation1.addArrangedSubview(snackbarAnimateTopRightButton)
        stackViewAnimation2.addArrangedSubview(snackbarAnimateBottomLeftButton)
        stackViewAnimation2.addArrangedSubview(snackbarAnimateBottomCenterButton)
        stackViewAnimation2.addArrangedSubview(snackbarAnimateBottomRightButton)

        addConstraints()
    }

    private func addConstraints() {
        let containerHeightConstraint = containerView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        containerHeightConstraint.priority = .defaultLow

        let constraints = [
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),

            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -NatSpacing.small),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: NatSpacing.small),
            containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            containerHeightConstraint,

            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: NatSpacing.small),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stackView.bottomAnchor.constraint(
                greaterThanOrEqualTo: containerView.bottomAnchor,
                constant: -NatSpacing.small
            )
        ]

        NSLayoutConstraint.activate(constraints)
    }

    private func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = NatFonts.font(ofSize: .heading6, withWeight: .regular)
        label.textColor = NatColors.highEmphasis
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }
}
