import UIKit
import NatDS
import NatDSIcons

class AlertViewController: UIViewController, SampleItem {
    static var name: String = "Alert"
    
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
    
    private let alert: NatAlert = {
        let alert = NatAlert(style: .warning)
        alert.configure(titleText: "Title example")
        alert.configure(descriptionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam id lectus ut nulla rutrum molestie eget ut quam.")
        return alert
    }()
    
    private let alertWithCustomIcon: NatAlert = {
        let alert = NatAlert(style: .warning)
        alert.configure(titleText: "Alert with custom Icon")
        alert.configure(descriptionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam id lectus ut nulla rutrum molestie eget ut quam.")
        alert.configure(icon: getIcon(.outlinedAlertWarning))
        return alert
    }()
    
    private let alertWithPrimaryButton: NatAlert = {
        let alert = NatAlert(style: .warning)
        alert.configure(titleText: "Alert with primary button")
        alert.configure(descriptionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam id lectus ut nulla rutrum molestie eget ut quam.")
        alert.configure(primaryButtonTitle: "Button 1")
        alert.configure(icon: getIcon(.outlinedAlertWarning))
        return alert
    }()
    
    private let alertWithSecondaryButton: NatAlert = {
        let alert = NatAlert(style: .warning)
        alert.configure(titleText: "Alert with two buttons")
        alert.configure(descriptionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam id lectus ut nulla rutrum molestie eget ut quam.")
        alert.configure(primaryButtonTitle: "Button 1")
        alert.configure(secondaryButtonTitle: "Button 2")
        alert.configure(icon: getIcon(.outlinedAlertWarning))
        return alert
    }()
    
    private let alertWithNoIcon: NatAlert = {
        let alert = NatAlert(style: .warning)
        alert.configure(titleText: "Alert without icon")
        alert.configure(descriptionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam id lectus ut nulla rutrum molestie eget ut quam.")
        alert.configure(showIcon: false)
        return alert
    }()
    
    private let alertWithNoTitle: NatAlert = {
        let alert = NatAlert(style: .warning)
        alert.configure(descriptionText: "Example of an alert with no title.")
        alert.showTitle = false
        return alert
    }()
    
    private let alertWithNoTitleAndNoIcon: NatAlert = {
        let alert = NatAlert(style: .warning)
        alert.configure(descriptionText: "Example of an alert with no icon and no title.")
        alert.showTitle = false
        alert.configure(showIcon: false)
        return alert
    }()
    
    private let alertOutlined: NatAlert = {
        let alert = NatAlert(style: .warning, type: .outlined)
        alert.configure(titleText: "Alert Warning outlined")
        alert.configure(descriptionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam id lectus ut nulla rutrum molestie eget ut quam.")
        return alert
    }()
    
    private let alertSuccess: NatAlert = {
        let alert = NatAlert(style: .success)
        alert.configure(titleText: "Alert Success")
        alert.configure(descriptionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam id lectus ut nulla rutrum molestie eget ut quam.")
        return alert
    }()
    
    private let alertSuccessOutlined: NatAlert = {
        let alert = NatAlert(style: .success, type: .outlined)
        alert.configure(titleText: "Alert Success outlined")
        alert.configure(descriptionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam id lectus ut nulla rutrum molestie eget ut quam.")
        return alert
    }()
    
    private let alertInfo: NatAlert = {
        let alert = NatAlert(style: .info)
        alert.configure(titleText: "Alert Info")
        alert.configure(descriptionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam id lectus ut nulla rutrum molestie eget ut quam.")
        return alert
    }()
    
    private let alertInfoOutlined: NatAlert = {
        let alert = NatAlert(style: .info, type: .outlined)
        alert.configure(titleText: "Alert Info outlined")
        alert.configure(descriptionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam id lectus ut nulla rutrum molestie eget ut quam.")
        return alert
    }()
    
    private let alertError: NatAlert = {
        let alert = NatAlert(style: .error)
        alert.configure(titleText: "Alert Error")
        alert.configure(descriptionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam id lectus ut nulla rutrum molestie eget ut quam.")
        return alert
    }()
    
    private let alertErrorOutlined: NatAlert = {
        let alert = NatAlert(style: .error, type: .outlined)
        alert.configure(titleText: "Alert Error outlined")
        alert.configure(descriptionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam id lectus ut nulla rutrum molestie eget ut quam.")
        return alert
    }()
    
    private let alertCustom: NatAlert = {
        let alert = NatAlert(style: .custom(backgroundColor: .cyan, borderColor: .blue, labelsColor: .red))
        alert.configure(titleText: "Alert Custom")
        alert.configure(descriptionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam id lectus ut nulla rutrum molestie eget ut quam.")
        return alert
    }()
    
    private let alertCustomOutlined: NatAlert = {
        let alert = NatAlert(style: .custom(backgroundColor: .cyan, borderColor: .blue, labelsColor: .red), type: .outlined)
        alert.configure(titleText: "Alert Custom outlined")
        alert.configure(descriptionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam id lectus ut nulla rutrum molestie eget ut quam.")
        return alert
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        addConstraints()
        setupUI()
    }
    
    private func addConstraints() {
        let containerHeightConstraint = containerView.centerYAnchor
            .constraint(equalTo: scrollView.centerYAnchor)
        containerHeightConstraint.priority = .defaultLow
        
        NSLayoutConstraint.activate([
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
        ])
    }
    
    private func setupUI() {
        title = "NatAlert"
        view.backgroundColor = .white
    }
    
    private func setup() {
        view.addSubview(scrollView)

        scrollView.addSubview(containerView)
        containerView.addSubview(stackView)
        stackView.addArrangedSubview(alert)
        stackView.addArrangedSubview(alertWithCustomIcon)
        stackView.addArrangedSubview(alertWithPrimaryButton)
        stackView.addArrangedSubview(alertWithSecondaryButton)
        stackView.addArrangedSubview(alertWithNoIcon)
        stackView.addArrangedSubview(alertWithNoTitleAndNoIcon)
        stackView.addArrangedSubview(alertWithNoTitle)
        stackView.addArrangedSubview(alertSuccess)
        stackView.addArrangedSubview(alertInfo)
        stackView.addArrangedSubview(alertError)
        stackView.addArrangedSubview(alertCustom)
        stackView.addArrangedSubview(alertOutlined)
        stackView.addArrangedSubview(alertSuccessOutlined)
        stackView.addArrangedSubview(alertInfoOutlined)
        stackView.addArrangedSubview(alertErrorOutlined)
        stackView.addArrangedSubview(alertCustomOutlined)
    }
}
