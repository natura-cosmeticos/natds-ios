extension NatSnackbar {
    // MARK: - Setup

    internal func setup() {
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setupFeedback(.default)
        self.setupAction()

        self.addSubview(self.containerView)

        self.containerView.addSubview(self.hStackView)

        self.blockButtonView.addSubview(self.blockButton)
        self.inlineButtonView.addSubview(self.inlineButton)
        self.inlineIconButtonView.addSubview(self.inlineIconButton)

        self.hStackView.addArrangedSubview(self.iconView)
        self.hStackView.addArrangedSubview(self.vStackView)
        self.hStackView.addArrangedSubview(self.inlineButtonView)
        self.hStackView.addArrangedSubview(self.inlineIconButtonView)

        self.vStackView.addArrangedSubview(self.titleLabel)
        self.vStackView.addArrangedSubview(self.bodyLabel)
        self.vStackView.addArrangedSubview(self.blockButtonView)

        self.setupConstraints()
    }

    internal func setupConstraints() {
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: NatSpacing.small),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: NatSpacing.standard),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -NatSpacing.standard),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -NatSpacing.small),
            hStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: NatSpacing.small),
            hStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: NatSpacing.small),
            hStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -NatSpacing.small),
            hStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -NatSpacing.small),
            bodyLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: NatSizes.standard),
            iconView.widthAnchor.constraint(equalToConstant: NatSizes.standard),
            iconView.heightAnchor.constraint(equalToConstant: NatSizes.standard),
            inlineButtonView.topAnchor.constraint(equalTo: hStackView.topAnchor),
            inlineButtonView.bottomAnchor.constraint(equalTo: hStackView.bottomAnchor),
            inlineButton.heightAnchor.constraint(equalToConstant: NatSizes.semiX),
            inlineButton.leadingAnchor.constraint(equalTo: inlineButtonView.leadingAnchor, constant: NatSpacing.tiny),
            inlineButton.trailingAnchor.constraint(equalTo: inlineButtonView.trailingAnchor),
            inlineButton.centerYAnchor.constraint(equalTo: inlineButtonView.centerYAnchor),
            inlineIconButtonView.topAnchor.constraint(equalTo: hStackView.topAnchor),
            inlineIconButtonView.bottomAnchor.constraint(equalTo: hStackView.bottomAnchor),
            inlineIconButton.leadingAnchor.constraint(equalTo: inlineIconButtonView.leadingAnchor, constant: NatSpacing.tiny),
            inlineIconButton.trailingAnchor.constraint(equalTo: inlineIconButtonView.trailingAnchor),
            inlineIconButton.centerYAnchor.constraint(equalTo: inlineIconButtonView.centerYAnchor),
            blockButtonView.leadingAnchor.constraint(equalTo: vStackView.leadingAnchor),
            blockButtonView.trailingAnchor.constraint(equalTo: vStackView.trailingAnchor),
            blockButton.heightAnchor.constraint(equalToConstant: NatSizes.semiX),
            blockButton.topAnchor.constraint(equalTo: blockButtonView.topAnchor),
            blockButton.bottomAnchor.constraint(equalTo: blockButtonView.bottomAnchor),
            blockButton.trailingAnchor.constraint(equalTo: blockButtonView.trailingAnchor),
            blockButton.leadingAnchor.constraint(greaterThanOrEqualTo: blockButtonView.leadingAnchor)
        ])
    }

    internal func setupFeedback(_ feedback: Feedback) {
        self.containerView.backgroundColor = feedback.color
        self.iconView.tintColor = feedback.textColor
        self.bodyLabel.textColor = feedback.textColor
        self.titleLabel.textColor = feedback.textColor
        self.inlineIconButton.configure(iconColor: feedback.textColor)
    }

    internal func setupAction() {
        self.blockButton.addTarget(self, action: #selector(callAction), for: .touchUpInside)
        self.inlineButton.addTarget(self, action: #selector(callAction), for: .touchUpInside)
        self.inlineIconButton.configure(delegate: self, action: {_ in
            self.callAction()
        })
    }

    internal func setupActionButton(_ actionButton: ActionButton) {
        self.blockButton.configure(title: "")
        self.inlineButton.configure(title: "")
        self.inlineIconButton.configure(icon: "")

        self.blockButtonView.isHidden = true
        self.inlineButtonView.isHidden = true
        self.inlineIconButtonView.isHidden = true

        switch actionButton {
        case .none:
            break
        case .button(let title):
            if title.count > inlineButtonMaxLength {
                self.blockButton.configure(title: title)
                self.blockButtonView.isHidden = false
            } else {
                self.inlineButton.configure(title: title)
                self.inlineButtonView.isHidden = false
            }
        case .iconButton(let icon):
            if !icon.isEmpty {
                self.inlineIconButton.configure(icon: icon)
                self.inlineIconButtonView.isHidden = false
            }
        }
    }

    // MARK: - Presenting

    internal func presentSnackbarFrom(view: UIView) {
        let constant = view.bounds.width

        view.addSubview(self)

        if #available(iOS 11.0, *) {
            topConstraint = self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        } else {
            topConstraint = self.topAnchor.constraint(equalTo: view.topAnchor)
        }

        if #available(iOS 11.0, *) {
            bottomConstraint = self.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        } else {
            bottomConstraint = self.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        }

        centerXConstraint = self.centerXAnchor.constraint(equalTo: view.centerXAnchor)

        switch animation {
        case .center:
            centerXConstraint?.constant = 0
            topConstraint?.constant = self.position == .topCenter ? -constant/2 : 0
            bottomConstraint?.constant = self.position == .bottomCenter ? constant/2 : 0
        case .left:
            centerXConstraint?.constant = -constant
        case .right:
            centerXConstraint?.constant = constant
        case .none:
            centerXConstraint?.constant = 0
        }

        switch position {
        case .topCenter:
            view.addConstraints([topConstraint!, centerXConstraint!])
        case .bottomCenter:
            view.addConstraints([bottomConstraint!, centerXConstraint!])
        }

        view.layoutSubviews()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05, execute: {
            self.presentAnimations(view)
        })
    }

    internal func presentAnimations(_ view: UIView) {
        let duration = self.animation == .none ? 0.0 : 0.3

        self.topConstraint?.constant = 0
        self.bottomConstraint?.constant = 0
        self.centerXConstraint?.constant = 0

        UIView.animate(withDuration: duration, delay: 0.0, options: .curveEaseOut, animations: {
            view.layoutIfNeeded()
        }, completion: {_ in
            self.startDismissTimer()
        })
    }

    // MARK: - Dismissing

    internal func startDismissTimer() {
        guard let interval = self.timer.interval else { return }

        DispatchQueue.main.asyncAfter(deadline: .now() + interval, execute: {
            self.dismissSnackbar()
        })
    }

    internal func dismissSnackbar() {
        guard let view = self.superview else { return }
        let constant = view.bounds.width

        switch animation {
        case .center:
            centerXConstraint?.constant = 0
            topConstraint?.constant = self.position == .topCenter ? -constant/2 : 0
            bottomConstraint?.constant = self.position == .bottomCenter ? constant/2 : 0
        case .left:
            centerXConstraint?.constant = -constant
        case .right:
            centerXConstraint?.constant = constant
        case .none:
            centerXConstraint?.constant = 0
        }

        UIView.animate(withDuration: self.animation == .none ? 0.0 : 0.3, animations: {
            view.layoutIfNeeded()
        }, completion: {_ in
            self.removeFromSuperview()
        })
    }
}
