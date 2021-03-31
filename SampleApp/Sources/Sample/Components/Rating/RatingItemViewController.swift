import UIKit
import NatDS
import NatDSIcons

class RatingItemViewController: UIViewController, SampleItem {

    static var name = "Rating"

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

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = NatSpacing.standard
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    let inputRatingWithHint: NatRating = {
        let rating = NatRating(style: .input)
        rating.configure(text: "Input size Semi (default)")
        return rating
    }()

    let inputRatingWithHintSemiX: NatRating = {
        let rating = NatRating(style: .input, size: .semiX)
        rating.configure(text: "Input size SemiX")
        return rating
    }()

    let inputRatingWithHintMedium: NatRating = {
        let rating = NatRating(style: .input, size: .medium)
        rating.configure(text: "Input size Medium")
        return rating
    }()

    let inputRating: NatRating = {
        let rating = NatRating(style: .input)
        return rating
    }()

    let readOnlyRatingSmall: NatRating = {
        let rating = NatRating(style: .readOnly, size: .small)
        return rating
    }()

    let readOnlyRating: NatRating = {
        let rating = NatRating(style: .readOnly)
        return rating
    }()

    let counterRating: NatRating = {
        let rating = NatRating(style: .counter, size: .semiX)
        rating.configure(text: "Counter Left (default)")
        return rating
    }()

    let counterRatingRight: NatRating = {
        let rating = NatRating(style: .counter, size: .small, alignment: .right)
        rating.configure(text: "Counter Right")
        return rating
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Self.name
        view.backgroundColor = NatColors.background

        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(stackView)

        setup()
    }

    private func setup() {
        addStackViewItems()
        addConstraints()
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

    private func addStackViewItems() {
        stackView.addArrangedSubview(inputRatingWithHint)
        stackView.addArrangedSubview(inputRatingWithHintSemiX)
        stackView.addArrangedSubview(inputRatingWithHintMedium)
        stackView.addArrangedSubview(inputRating)
        stackView.addArrangedSubview(readOnlyRating)
        stackView.addArrangedSubview(readOnlyRatingSmall)
        stackView.addArrangedSubview(counterRating)
        stackView.addArrangedSubview(counterRatingRight)
    }
}
