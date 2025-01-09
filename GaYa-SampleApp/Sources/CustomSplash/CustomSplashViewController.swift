//
//  CustomSplashViewController.swift
//  GaYa-SampleApp
//
//  Created by Hayna.Cardoso on 07/01/25.
//

import UIKit
import NatDS

final class CustomSplashViewController: UIViewController {

    // MARK: - Private properties

    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "NATDSBackground"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private let overlayView: GradientBackgroundView = {
        let view = GradientBackgroundView()
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "SplashLogo"))
        imageView.alpha = 0
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private let shortNamelabel: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .heading6)
        label.text = "GaYa"
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

    // MARK: - Life cycle

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
                self.overlayView.alpha = 1
                self.logoImageView.alpha = 1
                self.shortNamelabel.alpha = 1
                self.longNamelabel.alpha = 1
        }, completion: { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let navigationController = UINavigationController(
                    rootViewController: ChooseBrandViewController()
                )

                UIApplication.shared.keyWindow?.rootViewController = navigationController
            }
        })
    }

    // MARK: - Overrides

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

// MARK: - Private methods - UI

extension CustomSplashViewController {
    private func setup() {
        view.addSubview(backgroundImageView)
        view.addSubview(overlayView)
        view.addSubview(logoImageView)
        view.addSubview(shortNamelabel)
        view.addSubview(longNamelabel)

        addConstraints()
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor),

            overlayView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor),
            overlayView.rightAnchor.constraint(equalTo: backgroundImageView.rightAnchor),
            overlayView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor),
            overlayView.leftAnchor.constraint(equalTo: backgroundImageView.leftAnchor),

            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -NatSpacing.xLarge),

            shortNamelabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: NatSpacing.large),
            shortNamelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            longNamelabel.topAnchor.constraint(equalTo: shortNamelabel.bottomAnchor, constant: NatSpacing.micro),
            longNamelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
