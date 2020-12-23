import NatDS
import UIKit

//swiftlint:disable trailing_whitespace

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
    
    private let checkboxSelectionControl: NatSelectionControl = {
        let checkbox = NatSelectionControl(style: .checkbox)
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
        containerView.addSubview(checkboxSelectionControl)
        
        addConstraints()
    }
}

extension SelectionControlViewController {
    
    private func addConstraints() {
        addConstraintsScrollView()
        addConstraintsContainerView()
        addConstraintsCheckbox()
    }
    
    private func addConstraintsScrollView() {
        let constraints = [
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }

    private func addConstraintsContainerView() {
        let containerHeightConstraint = containerView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        containerHeightConstraint.priority = .defaultLow

        let constraints = [
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -NatSpacing.small),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: NatSpacing.small),
            containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            containerHeightConstraint
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addConstraintsCheckbox() {
        let constraints = [
            checkboxSelectionControl.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            checkboxSelectionControl.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
