//
//  GaYaBadge+Style.swift
//  GaYa DS
//
//  Created by Hayna.Cardoso on 13/02/25.
//  Copyright © 2025 Natura. All rights reserved.
//

import Foundation

extension GaYaBadge {
  /**
   Style is a enum that represents style values for the GaYaBadge component.
   
   These are the allowed styles for a GaYaBadge:
   - Standard
   - Dot
   
   - Requires:
   It's necessary to configure the Design System with a theme or fatalError will be raised.
   
   DesignSystem().configure(with: AvailableTheme)
   */
  
  public enum Style {
    case standard
    case dot
    case pulse
    
    var height: CGFloat {
      switch self {
      case .standard:
        return getComponentAttributeFromTheme(\.badgeStandardHeight)
      case .dot:
        return getComponentAttributeFromTheme(\.badgeDotHeight)
      case .pulse:
        return getComponentAttributeFromTheme(\.badgeDotHeight)
      }
    }
    
    var borderRadius: CGFloat {
      switch self {
      case .standard:
        return getComponentAttributeFromTheme(\.badgeStandardBorderRadius)
      case .dot:
        return getComponentAttributeFromTheme(\.badgeDotBorderRadius)
      case .pulse:
        return getComponentAttributeFromTheme(\.badgeDotBorderRadius)
      }
    }
  }
}
