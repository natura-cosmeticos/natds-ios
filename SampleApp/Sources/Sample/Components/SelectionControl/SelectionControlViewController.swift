import NatDS
import UIKit

final class SelectionControlViewController: UIViewController, SampleItem {

    static let name = "Selection Control"

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

    private let enabledUnselectedSelectionControl: NatSelectionControl = {
        let checkbox = NatSelectionControl(style: .checkbox)
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let enabledSelectedSelectionControl: NatSelectionControl = {
        let checkbox = NatSelectionControl(style: .checkbox)
        checkbox.isSelected = true
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let disabledUnselectedSelectionControl: NatSelectionControl = {
        let checkbox = NatSelectionControl(style: .checkbox)
        checkbox.isSelected = false
        checkbox.isEnabled = false
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let disabledSelectedSelectionControl: NatSelectionControl = {
        let checkbox = NatSelectionControl(style: .checkbox)
        checkbox.isSelected = true
        checkbox.isEnabled = false
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let enabledUnselectedLabelSelectionControl: NatSelectionControl = {
        let checkbox = NatSelectionControl(style: .radioButton, text: "Radio")
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let enabledSelectedLabelSelectionControl: NatSelectionControl = {
        let checkbox = NatSelectionControl(style: .radioButton, text: "Enabled selected with label")
        checkbox.isSelected = true
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let disabledUnselectedLabelSelectionControl: NatSelectionControl = {
        let checkbox = NatSelectionControl(style: .checkbox, text: "Disabled unselected with label")
        checkbox.isSelected = false
        checkbox.isEnabled = false
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let disabledSelectedLabelSelectionControl: NatSelectionControl = {
        let checkbox = NatSelectionControl(style: .checkbox, text: "Disabled selected with label")
        checkbox.isSelected = true
        checkbox.isEnabled = false
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Private methods

    private func setup() {
        title = Self.name
        view.backgroundColor = NatColors.background
        view.addSubview(scrollView)

        scrollView.addSubview(containerView)

        containerView.addSubview(stackView)

        stackView.addArrangedSubview(enabledUnselectedSelectionControl)
        stackView.addArrangedSubview(enabledSelectedSelectionControl)
        stackView.addArrangedSubview(disabledUnselectedSelectionControl)
        stackView.addArrangedSubview(disabledSelectedSelectionControl)
        stackView.addArrangedSubview(enabledUnselectedLabelSelectionControl)
        stackView.addArrangedSubview(enabledSelectedLabelSelectionControl)
        stackView.addArrangedSubview(disabledUnselectedLabelSelectionControl)
        stackView.addArrangedSubview(disabledSelectedLabelSelectionControl)

        addConstraints()
    }
}

extension SelectionControlViewController {

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
}
