import UIKit
import NatDS

final class CustomSplashViewController: UIViewController {
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "splashBackground"))
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "SplashLogo"))
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private let shortNamelabel: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .heading6)
        label.text = "NATDS"
        label.textColor = .white
        label.alpha = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let longNamelabel: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .heading6)
        label.text = "Natura Design System"
        label.textColor = .white
        label.alpha = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        UIView.transition(
            with: view,
            duration: 2,
            options: .curveEaseIn,
            animations: {
                self.logoImageView.alpha = 1
                self.shortNamelabel.alpha = 1
                self.longNamelabel.alpha = 1
        }, completion: { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                let navigationController = UINavigationController(
                    rootViewController: ChooseBrandViewController()
                )

                UIApplication.shared.keyWindow?.rootViewController = navigationController
            }
        })
    }

    private func setup() {
        view.addSubview(backgroundImageView)
        view.addSubview(logoImageView)
        view.addSubview(shortNamelabel)
        view.addSubview(longNamelabel)

        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor),

            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            logoImageView.widthAnchor.constraint(equalToConstant: NatSizes.veryHuge),
            logoImageView.heightAnchor.constraint(equalToConstant: NatSizes.semi),

            shortNamelabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: NatSpacing.large),
            shortNamelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            longNamelabel.topAnchor.constraint(equalTo: shortNamelabel.bottomAnchor, constant: NatSpacing.micro),
            longNamelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
