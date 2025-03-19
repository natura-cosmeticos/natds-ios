//
//  GaYaBadge+Color.swift
//  GaYa DS
//
//  Created by Hayna.Cardoso on 13/02/25.
//  Copyright © 2025 Natura. All rights reserved.
//

extension GaYaBadge {
  /**
   Color is a enum that represents color values for the GaYaBadge component.
   
   These are the allowed colors for a GaYaBadge:
   - Alert
   - Primary
   - Secondary
   - Success
   - Inverse
   
   - Requires:
   It's necessary to configure the Design System with a theme or fatalError will be raised.
   
   DesignSystem().configure(with: AvailableTheme)
   */
  
  public enum Color {
    case alert
    case primary
    case secondary
    case success
    case inverse
  }
}

extension GaYaBadge.Color {
  var box: UIColor {
    switch self {
    case .alert:
      return getUIColorFromComponentAttributes(\.badgeColorAlertBackground)
      
    case .primary:
      return getUIColorFromComponentAttributes(\.badgeColorPrimaryBackground)
      
    case .secondary:
      return getUIColorFromComponentAttributes(\.badgeColorSecondaryBackground)
      
    case .success:
      return getUIColorFromComponentAttributes(\.badgeColorSuccessBackground)
      
    case .inverse:
      return getUIColorFromComponentAttributes(\.badgeColorInverseBackground)
    }
  }
  
  var content: UIColor {
    switch self {
    case .alert:
      return getUIColorFromComponentAttributes(\.badgeColorAlertLabel)
      
    case .primary:
      return getUIColorFromComponentAttributes(\.badgeColorPrimaryLabel)
      
    case .secondary:
      return getUIColorFromComponentAttributes(\.badgeColorSecondaryLabel)
      
    case .success:
      return getUIColorFromComponentAttributes(\.badgeColorSuccessLabel)
      
    case .inverse:
      return getUIColorFromComponentAttributes(\.badgeColorInverseLabel)
    }
  }
}

