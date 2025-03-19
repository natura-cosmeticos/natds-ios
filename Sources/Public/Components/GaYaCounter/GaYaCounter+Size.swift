//
//  GaYaCounter+Size.swift
//  GaYa DS
//
//  Created by Hayna.Cardoso on 12/02/25.
//  Copyright © 2025 Natura. All rights reserved.
//

extension GaYaCounter {
    /**
     Size is a enum that represents size values for GaYaCounter component.

     These are all sizes allowed for a GaYaCounter:
     - semi
     - medium

     - Requires:
     It's necessary to configure the Design System with a theme or fatalError will be raised.

            DesignSystem().configure(with: AvailableTheme)
     */

    public enum Size: CaseIterable {
        case semi
        case medium
    }
}

extension GaYaCounter.Size {
    var value: CGFloat {
        switch self {
        case .semi:
            return getTokenFromTheme(\.sizeSemi)
        case .medium:
            return getTokenFromTheme(\.sizeMedium)
        }
    }
    
    var borderRadius: CGFloat {
        switch self {
        case .semi:
            return getComponentAttributeFromTheme(\.isInputRounded)
                ? getTokenFromTheme(\.sizeSemiX) / 2
                : getComponentAttributeFromTheme(\.counterBorderRadius)
        case .medium:
            return getComponentAttributeFromTheme(\.isInputRounded)
                ? getTokenFromTheme(\.sizeMedium) / 2
                : getComponentAttributeFromTheme(\.counterBorderRadius)
        }
    }

    var buttonWidth: CGFloat {
        switch self {
        case .semi:
            return getTokenFromTheme(\.sizeSemi)
        case .medium:
            return getTokenFromTheme(\.sizeSemiX)
        }
    }

    var buttonHeight: CGFloat {
        switch self {
        case .semi:
            return getTokenFromTheme(\.sizeSemiX)
        case .medium:
            return getTokenFromTheme(\.sizeMedium)
        }
    }
}
