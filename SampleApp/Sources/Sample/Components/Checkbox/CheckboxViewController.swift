import NatDS
import UIKit

final class CheckboxViewController: UIViewController, SampleItem {

    static let name = "Checkbox"

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
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private let enabledUnselectedCheckbox: NatCheckbox = {
        let checkbox = NatCheckbox()
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let enabledSelectedCheckbox: NatCheckbox = {
        let checkbox = NatCheckbox()
        checkbox.configure(isSelected: true)
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let indeterminateEnabledSelectedCheckbox: NatCheckbox = {
        let checkbox = NatCheckbox()
        checkbox.configure(isSelected: true)
        checkbox.configure(isIndeterminate: true)
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let disabledUnselectedCheckbox: NatCheckbox = {
        let checkbox = NatCheckbox()
        checkbox.configure(isSelected: false)
        checkbox.configure(isEnabled: false)
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let disabledSelectedCheckbox: NatCheckbox = {
        let checkbox = NatCheckbox()
        checkbox.configure(isSelected: true)
        checkbox.configure(isEnabled: false)
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let indeterminateDisabledSelectedCheckbox: NatCheckbox = {
        let checkbox = NatCheckbox()
        checkbox.configure(isSelected: true)
        checkbox.configure(isEnabled: false)
        checkbox.configure(isIndeterminate: true)
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let enabledUnselectedLabelCheckbox: NatCheckbox = {
        let checkbox = NatCheckbox(theme: .avonLight)
        checkbox.configure(text: "Enabled unselected with label")
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let enabledSelectedLabelCheckbox: NatCheckbox = {
        let checkbox = NatCheckbox(theme: .avonLight)
        checkbox.configure(isSelected: true)
        checkbox.configure(text: "Enabled selected with label")
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let disabledUnselectedLabelCheckbox: NatCheckbox = {
        let checkbox = NatCheckbox()
        checkbox.configure(isSelected: false)
        checkbox.configure(isEnabled: false)
        checkbox.configure(isIndeterminate: true)
        checkbox.configure(text: "Disabled unselected with label")
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let disabledSelectedLabelCheckbox: NatCheckbox = {
        let checkbox = NatCheckbox()
        checkbox.configure(isSelected: true)
        checkbox.configure(isEnabled: false)
        checkbox.configure(text: "Disabled selected with label")
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let indeterminateEnableSelectedLabelCheckbox: NatCheckbox = {
        let checkbox = NatCheckbox()
        checkbox.configure(isSelected: true)
        checkbox.configure(isEnabled: true)
        checkbox.configure(text: "Indeterminate enable selected with label")
        checkbox.configure(isIndeterminate: true)
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    // swiftlint:disable:next identifier_name
    private let indeterminateDisabledSelectedLabelCheckbox: NatCheckbox = {
        let checkbox = NatCheckbox()
        checkbox.configure(isSelected: true)
        checkbox.configure(isEnabled: false)
        checkbox.configure(text: "Indeterminate disabled selected with label")
        checkbox.configure(isIndeterminate: true)
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupHandlers()
    }

    // MARK: - Private methods

    private func setup() {
        title = Self.name
        view.backgroundColor = NatColors.background
        view.addSubview(scrollView)

        scrollView.addSubview(containerView)

        containerView.addSubview(stackView)

        stackView.addArrangedSubview(enabledUnselectedCheckbox)
        stackView.addArrangedSubview(enabledSelectedCheckbox)
        stackView.addArrangedSubview(indeterminateEnabledSelectedCheckbox)
        stackView.addArrangedSubview(disabledUnselectedCheckbox)
        stackView.addArrangedSubview(disabledSelectedCheckbox)
        stackView.addArrangedSubview(indeterminateDisabledSelectedCheckbox)
        stackView.addArrangedSubview(enabledUnselectedLabelCheckbox)
        stackView.addArrangedSubview(enabledSelectedLabelCheckbox)
        stackView.addArrangedSubview(indeterminateEnableSelectedLabelCheckbox)
        stackView.addArrangedSubview(disabledUnselectedLabelCheckbox)
        stackView.addArrangedSubview(disabledSelectedLabelCheckbox)
        stackView.addArrangedSubview(indeterminateDisabledSelectedLabelCheckbox)

        addConstraints()
    }
}

extension CheckboxViewController {

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

    private func setupHandlers() {
        enabledUnselectedCheckbox.configure { isChecked in
            let alert = UIAlertController(title: "Taps",
                                          message: "It's marked as \(isChecked)",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok",
                                          style: .default,
                                          handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
