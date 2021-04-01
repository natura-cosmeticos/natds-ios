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
        stackView.spacing = NatSpacing.small
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    let inputRatingWithHint: NatRating = {
        let rating = NatRating(style: .input)
        rating.configure(text: "Hint placeholder")
        return rating
    }()

    let inputRatingWithHintSemiX: NatRating = {
        let rating = NatRating(style: .input, size: .semiX)
        rating.configure(text: "Hint placeholder")
        return rating
    }()

    let inputRatingWithHintMedium: NatRating = {
        let rating = NatRating(style: .input, size: .medium)
        rating.configure(text: "Hint placeholder")
        return rating
    }()

    let inputRating: NatRating = {
        let rating = NatRating(style: .input)
        rating.configure(rate: 3)
        rating.configure(state: .disabled)
        return rating
    }()

    let readOnlyRating: NatRating = {
        let rating = NatRating(style: .readOnly)
        rating.configure(rate: 2)
        return rating
    }()

    let counterRating: NatRating = {
        let rating = NatRating(style: .counter)
        rating.configure(text: "Hint placeholder")
        return rating
    }()

    let counterRatingRight: NatRating = {
        let rating = NatRating(style: .counter, alignment: .right)
        rating.configure(text: "Hint placeholder")
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
        stackView.addArrangedSubview(createViewWithDescription("Input with hint (default)",
                                                               rating: inputRatingWithHint))
        stackView.addArrangedSubview(createViewWithDescription("Input with hint size Semi X",
                                                               rating: inputRatingWithHintSemiX))
        stackView.addArrangedSubview(createViewWithDescription("Input with hint size Medium",
                                                               rating: inputRatingWithHintMedium))
        stackView.addArrangedSubview(createViewWithDescription("Input disabled",
                                                               rating: inputRating))
        stackView.addArrangedSubview(createViewWithDescription("Read only default",
                                                               rating: readOnlyRating))
        stackView.addArrangedSubview(createViewWithDescription("Counter left (default)",
                                                               rating: counterRating))
        stackView.addArrangedSubview(createViewWithDescription("Counter right",
                                                               rating: counterRatingRight))
    }

    private func createViewWithDescription(_ text: String, rating: NatRating) -> UIView {
        let view = UIView()
        let label = UILabel()
        label.text = text
        label.textColor = NatColors.highEmphasis
        label.font = NatFonts.font(ofSize: .body1)
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.micro).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: NatSpacing.small).isActive = true
        view.addSubview(rating)
        rating.translatesAutoresizingMaskIntoConstraints = false
        rating.topAnchor.constraint(equalTo: label.bottomAnchor, constant: NatSpacing.micro).isActive = true
        rating.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NatSpacing.micro).isActive = true
        rating.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -NatSpacing.micro).isActive = true
        rating.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -NatSpacing.micro).isActive = true
        return view
    }
}
