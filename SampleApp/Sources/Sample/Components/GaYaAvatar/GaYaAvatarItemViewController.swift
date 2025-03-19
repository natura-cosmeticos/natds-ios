//
//  GaYaAvatarItemViewController.swift
//  GaYa DS-SampleApp
//
//  Created by Hayna.Cardoso on 15/06/24.
//  Copyright © 2024 Natura. All rights reserved.
//

import Foundation

import UIKit
import NatDS

class GaYaAvatarItemViewController: UIViewController, SampleItem {
    static var name = "GaYaAvatar"

    private lazy var standardStackView = createStackView()
    private lazy var semiStackView = createStackView()
    private lazy var semixStackView = createStackView()
    private lazy var mediumStackView = createStackView()
    private lazy var largexxxStackView = createStackView()
    
    private lazy var standardThemeStackView = createStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Self.name
        view.backgroundColor = NatColors.background

        setup()
    }

    private func setup() {
        view.addSubview(standardStackView)
        view.addSubview(semiStackView)
        view.addSubview(semixStackView)
        view.addSubview(mediumStackView)
        view.addSubview(largexxxStackView)
        
        view.addSubview(standardThemeStackView)

        let standardAvatars = createAvatars(size: .standard,
                                            image: UIImage(),
                                            name: "Natura Design System")
        standardAvatars.forEach { standardStackView.addArrangedSubview($0) }

        let semiAvatars = createAvatars(size: .semi,
                                        image: UIImage(),
                                        name: "Natura Design System")
        semiAvatars.forEach { semiStackView.addArrangedSubview($0) }

        let semixAvatars = createAvatars(size: .semiX,
                                         image: UIImage(),
                                         name: "Natura Design System")
        semixAvatars.forEach { semixStackView.addArrangedSubview($0) }

        let mediumAvatars = createAvatars(size: .medium,
                                          image: UIImage(),
                                          name: "Natura Design System")
        mediumAvatars.forEach { mediumStackView.addArrangedSubview($0) }

        let largexxxAvatars = createAvatars(size: .largeXXX,
                                            image: UIImage(),
                                            name: "Natura Design System")
        largexxxAvatars.forEach { largexxxStackView.addArrangedSubview($0) }
        
        
        let standardThemeAvatars = createThemeAvatars(size: .standard,
                                            image: UIImage(),
                                            name: "Natura Design System")
        standardThemeAvatars.forEach { standardThemeStackView.addArrangedSubview($0) }
       

        addConstraints()
    }

    private func createAvatars(size: GaYaAvatar.Size, image: UIImage, name: String) -> [GaYaAvatar] {
        (0...2).map { value in
            let avatar = GaYaAvatar(size: size)

            if value == 0 {
                avatar.configure(icon: getIcon(.outlinedContentHandsoap))
            }

            if value == 1 {
                avatar.configure(name: name)
            }

            if value == 2 {
                avatar.configure(image: UIImage(named: "ImageAreaPlaceholder"))
            }
            return avatar
        }
    }
    
    private func createThemeAvatars(size: GaYaAvatar.Size, image: UIImage, name: String) -> [GaYaAvatar] {
        (0...2).map { value in
            let avatar = GaYaAvatar(size: size, theme: .avonLight)

            if value == 0 {
                avatar.configure(icon: getIcon(.outlinedDefaultMockup))
            }

            if value == 1 {
                avatar.configure(name: name)
            }

            if value == 2 {
                avatar.configure(image: UIImage(named: "ImageAreaPlaceholder"))
            }
            return avatar
        }
    }

    private func createStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = NatSpacing.tiny
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }

    private func addConstraints() {
        let constraints = [
            // STANDARD
            standardStackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: NatSpacing.small
            ),
            standardStackView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -NatSpacing.standard
            ),
            standardStackView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: NatSpacing.standard
            ),
            standardStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            standardStackView.heightAnchor.constraint(equalToConstant: NatSizes.standard),

            // SEMI
            semiStackView.topAnchor.constraint(
                equalTo: standardStackView.bottomAnchor,
                constant: NatSpacing.standard
            ),
            semiStackView.widthAnchor.constraint(equalTo: standardStackView.widthAnchor),
            semiStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            semiStackView.heightAnchor.constraint(equalToConstant: NatSizes.semi),

            // SEMIX
            semixStackView.topAnchor.constraint(
                equalTo: semiStackView.bottomAnchor,
                constant: NatSpacing.standard
            ),
            semixStackView.widthAnchor.constraint(equalTo: semiStackView.widthAnchor),
            semixStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            semixStackView.heightAnchor.constraint(equalToConstant: NatSizes.semiX),

            // MEDIUM
            mediumStackView.topAnchor.constraint(
                equalTo: semixStackView.bottomAnchor,
                constant: NatSpacing.standard
            ),
            mediumStackView.widthAnchor.constraint(equalTo: semixStackView.widthAnchor),
            mediumStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mediumStackView.heightAnchor.constraint(equalToConstant: NatSizes.medium),

            // LARGEXXX
            largexxxStackView.topAnchor.constraint(
                equalTo: mediumStackView.bottomAnchor,
                constant: NatSpacing.standard
            ),
            largexxxStackView.widthAnchor.constraint(equalTo: mediumStackView.widthAnchor),
            largexxxStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            largexxxStackView.heightAnchor.constraint(equalToConstant: NatSizes.largeXXX),
            
            // AVON THEME
            standardThemeStackView.topAnchor.constraint(
                equalTo: largexxxStackView.bottomAnchor,
                constant: NatSpacing.standard
            ),
            standardThemeStackView.widthAnchor.constraint(equalTo: largexxxStackView.widthAnchor),
            standardThemeStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            standardThemeStackView.heightAnchor.constraint(equalToConstant: NatSizes.standard)
        ]

        NSLayoutConstraint.activate(constraints)
    }

}
