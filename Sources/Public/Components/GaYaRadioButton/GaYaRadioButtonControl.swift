//
//  GaYaRadioButtonControl.swift
//  NatDS
//
//  Created by Hayna.Cardoso on 02/06/25.
//  Copyright © 2025 Natura. All rights reserved.
//

import UIKit

final class GaYaRadioButtonControl: UIControl {

    var onTouchesBegan: ((Set<UITouch>) -> Void)?
    var onTouchesEnded: ((Set<UITouch>) -> Void)?

    var handler: SelectionHandler?
    var isHapticFeedbackEnabled: Bool = false
    var isIndeterminate: Bool = false
    var labelComponent: String?
    var isGrouped: Bool = false
    var groupId: Int = 0
    var theme: AvailableTheme = .none

    private let increasedTouchRadius: CGFloat = 5
    private let notificationCenter: NotificationCenterObservable
    private var feedbackGenerator: UIImpactFeedbackGenerator?

    override var isSelected: Bool {
        didSet {
            self.setNeedsDisplay()
            super.isSelected = isSelected
            handler?(isSelected)
        }
    }

    init(notificationCenter: NotificationCenterObservable = NotificationCenter.default, theme:AvailableTheme = .none) {
        
        self.notificationCenter = notificationCenter
        self.theme = theme

        super.init(frame: .zero)

        setup()
    }

    override init(frame: CGRect = .zero) {
        self.notificationCenter = NotificationCenter.default
        super.init(frame: frame)

        setup()
    }

    deinit {
        notificationCenter.removeObserver(self)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.setNeedsDisplay()
    }

    private func setup() {
        backgroundColor = .clear

        notificationCenter.addObserver(
            self,
            selector: #selector(themeHasChanged),
            name: .themeHasChanged,
            object: nil
        )
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        feedbackGenerator = UIImpactFeedbackGenerator(style: .light)
        feedbackGenerator?.prepare()

        onTouchesBegan?(touches)

        if self.isGrouped {
            let groupId: [String: Int] = ["id": self.groupId]
            NotificationCenter.default.post(name: .stateWillChange, object: nil, userInfo: groupId)
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isSelected.toggle()
        sendActions(for: .valueChanged)

        if isHapticFeedbackEnabled {
            feedbackGenerator?.impactOccurred()
            feedbackGenerator = nil
        }

        onTouchesEnded?(touches)

        if self.isGrouped {
            let groupId: [String: Int] = ["id": self.groupId]
            NotificationCenter.default.post(name: .stateHasChanged, object: nil, userInfo: groupId)
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
    }

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {

        let relativeFrame = self.bounds
        let hitTestEdgeInsets = UIEdgeInsets(top: -increasedTouchRadius,
                                             left: -increasedTouchRadius,
                                             bottom: -increasedTouchRadius,
                                             right: -increasedTouchRadius)
        let hitFrame = relativeFrame.inset(by: hitTestEdgeInsets)
        return hitFrame.contains(point)
    }

    override func draw(_ rect: CGRect) {

        let borderWidth: CGFloat = 2

        let context = UIGraphicsGetCurrentContext()
        
        var defaultTheme: Style {
            Style(uncheckedBorderColor: getUIColorFromTokens(\.colorMediumEmphasis),
                  uncheckedBackgroundColor: .clear,
                  checkedBorderColor: getUIColorFromComponentAttributes(\.radioButtonColorSelectBorder),
                  checkedBackgroundColor: getUIColorFromComponentAttributes(\.radioButtonColorSelectContent),
                  checkmarkColor: .white)
        }
        
        var customTheme: Style {
            Style(uncheckedBorderColor: getUIColorFromTokens(\.colorMediumEmphasis),
                  uncheckedBackgroundColor: .clear,
                  checkedBorderColor: hexStringToUIColor(hex: theme.newInstance.components.radioButtonColorSelectBorder),
                  checkedBackgroundColor: hexStringToUIColor(hex: theme.newInstance.components.radioButtonColorSelectContent),
                  checkmarkColor: .white)
        }
        
        if (self.theme == .none) {
            context?.setStrokeColor(defaultTheme.borderColor(isSelected, isEnabled: isEnabled).cgColor)
        }
        else
        {
            context?.setStrokeColor(customTheme.borderColor(isSelected, isEnabled: isEnabled).cgColor)
        }
        
        context?.setLineWidth(borderWidth)

        let halfSize: CGFloat = min(bounds.size.width/2, bounds.size.height/2)

        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x: halfSize, y: halfSize),
            radius: CGFloat(halfSize - (borderWidth/2)),
            startAngle: CGFloat(0),
            endAngle: CGFloat(Double.pi * 2),
            clockwise: true)
        
        if (self.theme == .none) {
            defaultTheme.backgroundColor(isSelected, isEnabled: isEnabled).setFill()
        }
        else
        {
            customTheme.backgroundColor(isSelected, isEnabled: isEnabled).setFill()
        }

        context?.addPath(circlePath.cgPath)
        context?.strokePath()
        context?.fillPath()

        if isSelected {
            drawRadioSelector(frame: rect)
        }
    }

    private func drawRadioSelector(frame: CGRect) {
        let halfSize: CGFloat = min(bounds.size.width/2, bounds.size.height/2)
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x: bounds.midX, y: bounds.midY),
            radius: CGFloat(halfSize/2),
            startAngle: CGFloat(0),
            endAngle: CGFloat(Double.pi * 2),
            clockwise: true)

        circlePath.fill()

    }
}

extension GaYaRadioButtonControl {
    @objc internal func themeHasChanged() {
        //style = Style.default
    }
}
