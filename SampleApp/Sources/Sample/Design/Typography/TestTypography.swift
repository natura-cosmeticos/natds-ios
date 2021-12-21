import NatDS
import UIKit

class TestTypographyViewController: UIViewController, SampleItem {
    static var name = "Typography Test"

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceHorizontal = false
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()

    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = NatSpacing.small
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let displayLabel: UILabel = {
        let label = NatFonts.text(ofSize: .heading2,
                                  customStyle: .display,
                                  text: "display")
        label.textColor = NatColors.onBackground
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let headlineLabel: UILabel = {
        let label = NatFonts.text(ofSize: .heading2,
                                  customStyle: .headline,
                                  text: "headline")
        label.textColor = NatColors.onBackground
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let bodyRegularLabel: UILabel = {
        let label = NatFonts.text(ofSize: .heading2,
                                  customStyle: .bodyRegular,
                                  text: "body regular")
        label.textColor = NatColors.onBackground
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bodyBoldLabel: UILabel = {
        let label = NatFonts.text(ofSize: .heading2,
                                  customStyle: .bodyBold,
                                  text: "body bold")
        label.textColor = NatColors.onBackground
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Life cycle

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
        addConstraints()
        stackView.addArrangedSubview(displayLabel)
        stackView.addArrangedSubview(headlineLabel)
        stackView.addArrangedSubview(bodyRegularLabel)
        stackView.addArrangedSubview(bodyBoldLabel)
    }

    private func addConstraints() {
        let containerHeightConstraint = containerView.centerYAnchor
            .constraint(equalTo: scrollView.centerYAnchor)
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
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -NatSpacing.small)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
