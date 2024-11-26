//
//  GaYaTagViewController.swift
//  NatDS-SampleApp
//
//  Created by Hayna.Cardoso on 24/11/24.
//  Copyright © 2024 Natura. All rights reserved.
//

import Foundation
import NatDS

class GaYaTagViewController: UIViewController, SampleItem {
    static var name: String = "GaYaTag"
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = false
        scrollView.keyboardDismissMode = .interactive
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = GaYaDimensions.spacingSemi
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private var tagDefaultPrimary: GaYaTag = {
        let tag = GaYaTag(style: .default)
        tag.configure(text: "Default Primary Small")
        tag.configure(color: .primary)
        tag.configure(size: .small)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()
    
    private var tagDefaultPrimary2: GaYaTag = {
        let tag = GaYaTag(style: .default)
        tag.configure(text: "Default Primary Lightest Small")
        tag.configure(color: .primaryLightest)
        tag.configure(size: .small)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()
    
    private var tagDefaultPrimary3: GaYaTag = {
        let tag = GaYaTag(style: .default)
        tag.configure(text: "Default Primary Darkest Small")
        tag.configure(color: .primaryDarkest)
        tag.configure(size: .small)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()
    
    private var tagCustomDefaultPrimary: GaYaTag = {
        let tag = GaYaTag(style: .default, theme: .avonLight)
        tag.configure(text: "Default Primary Avon")
        tag.configure(color: .primary)
        tag.configure(size: .small)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()

    private var tagDefaultSecondary: GaYaTag = {
        let tag = GaYaTag(style: .default)
        tag.configure(text: "Default Secondary Standard")
        tag.configure(color: .secondary)
        tag.configure(size: .standard)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()
    
    private var tagDefaultSecondary2: GaYaTag = {
        let tag = GaYaTag(style: .default)
        tag.configure(text: "Default Secondary Standard")
        tag.configure(color: .secondaryLightest)
        tag.configure(size: .standard)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()
    
    private var tagDefaultSecondary3: GaYaTag = {
        let tag = GaYaTag(style: .default)
        tag.configure(text: "Default Secondary Standard")
        tag.configure(color: .secondaryDarkest)
        tag.configure(size: .standard)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()

    private var tagLeftSuccess: GaYaTag = {
        let tag = GaYaTag(style: .left)
        tag.configure(text: "Left Success Small")
        tag.configure(color: .success)
        tag.configure(size: .small)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()
    
    private var tagLeftSuccess2: GaYaTag = {
        let tag = GaYaTag(style: .left)
        tag.configure(text: "Left Success Small")
        tag.configure(color: .successLightest)
        tag.configure(size: .small)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()
    
    private var tagLeftSuccess3: GaYaTag = {
        let tag = GaYaTag(style: .left)
        tag.configure(text: "Left Success Small")
        tag.configure(color: .successDarkest)
        tag.configure(size: .small)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()

    private var tagLeftAlert: GaYaTag = {
        let tag = GaYaTag(style: .left)
        tag.configure(text: "Left Alert Standard")
        tag.configure(color: .alert)
        tag.configure(size: .standard)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()
    
    private var tagLeftAlert2: GaYaTag = {
        let tag = GaYaTag(style: .left)
        tag.configure(text: "Left Alert Standard")
        tag.configure(color: .alertLightest)
        tag.configure(size: .standard)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()
    
    private var tagLeftAlert3: GaYaTag = {
        let tag = GaYaTag(style: .left)
        tag.configure(text: "Left Alert Standard")
        tag.configure(color: .alertDarkest)
        tag.configure(size: .standard)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()

    private var tagRightWarning: GaYaTag = {
        let tag = GaYaTag(style: .right)
        tag.configure(text: "Right Warning Small")
        tag.configure(color: .warning)
        tag.configure(size: .small)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()
    
    private var tagRightWarning2: GaYaTag = {
        let tag = GaYaTag(style: .right)
        tag.configure(text: "Right Warning Small")
        tag.configure(color: .warningLightest)
        tag.configure(size: .small)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()
    
    private var tagRightWarning3: GaYaTag = {
        let tag = GaYaTag(style: .right)
        tag.configure(text: "Right Warning Small")
        tag.configure(color: .warningDarkest)
        tag.configure(size: .small)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()

    private var tagRightLink: GaYaTag = {
        let tag = GaYaTag(style: .right)
        tag.configure(text: "Right Info Standard")
        tag.configure(color: .info)
        tag.configure(size: .standard)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()
    
    private var tagRightLink2: GaYaTag = {
        let tag = GaYaTag(style: .right)
        tag.configure(text: "Right Info Standard")
        tag.configure(color: .infoLightest)
        tag.configure(size: .standard)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()
    
    private var tagRightLink3: GaYaTag = {
        let tag = GaYaTag(style: .right)
        tag.configure(text: "Right Info Standard")
        tag.configure(color: .infoDarkest)
        tag.configure(size: .standard)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()
    
    private var tagIconDefault: GaYaTag = {
        let tag = GaYaTag(style: .default, icon: getIcon(.outlinedPlaceBus))
        tag.configure(text: "Tag Icon Default")
        tag.configure(color: .primary)
        tag.configure(size: .standard)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()
    
    private var tagIconDefault2: GaYaTag = {
        let tag = GaYaTag(style: .left, icon: getIcon(.filledActionLove))
        tag.configure(text: "Tag Icon Left")
        tag.configure(color: .secondary)
        tag.configure(size: .standard)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()
    
    private var tagIconDefault3: GaYaTag = {
        let tag = GaYaTag(style: .right, icon: getIcon(.outlinedActionMic))
        tag.configure(text: "Tag Icon Right")
        tag.configure(color: .secondaryLightest)
        tag.configure(size: .standard)
        tag.translatesAutoresizingMaskIntoConstraints = false

        return tag
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        title = Self.name
        view.backgroundColor = GaYaColors.background

        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(tagDefaultPrimary)
        stackView.addArrangedSubview(tagDefaultPrimary2)
        stackView.addArrangedSubview(tagDefaultPrimary3)
        stackView.addArrangedSubview(tagCustomDefaultPrimary)
        stackView.addArrangedSubview(tagDefaultSecondary)
        stackView.addArrangedSubview(tagDefaultSecondary2)
        stackView.addArrangedSubview(tagDefaultSecondary3)
        stackView.addArrangedSubview(tagLeftSuccess)
        stackView.addArrangedSubview(tagLeftSuccess2)
        stackView.addArrangedSubview(tagLeftSuccess3)
        stackView.addArrangedSubview(tagLeftAlert)
        stackView.addArrangedSubview(tagLeftAlert2)
        stackView.addArrangedSubview(tagLeftAlert3)
        stackView.addArrangedSubview(tagRightWarning)
        stackView.addArrangedSubview(tagRightWarning2)
        stackView.addArrangedSubview(tagRightWarning3)
        stackView.addArrangedSubview(tagRightLink)
        stackView.addArrangedSubview(tagRightLink2)
        stackView.addArrangedSubview(tagRightLink3)
        stackView.addArrangedSubview(tagIconDefault)
        stackView.addArrangedSubview(tagIconDefault2)
        stackView.addArrangedSubview(tagIconDefault3)

        addConstraints()
    }
    
    private func addConstraints() {

        let constraints = [
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    private func createTag(style: GaYaTag.Style, text: String) -> GaYaTag {
        let tag = GaYaTag(style: style)
        tag.configure(text: text)
        return tag
    }
}
