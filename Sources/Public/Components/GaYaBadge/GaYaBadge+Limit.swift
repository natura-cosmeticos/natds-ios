//
//  GaYaBadge+Limit.swift
//  NatDS
//
//  Created by Hayna.Cardoso on 13/02/25.
//  Copyright © 2025 Natura. All rights reserved.
//

extension GaYaBadge {
  /**
   Limit is a enum that represents limits values for the GaYaBadge component.
   
   These are the allowed limits for a GaYaBadge:
   - max9: if the value exceeds 9, it shows 9+
   - max99: if the value exceeds 99, it shows 99+
   - unlimited: it shows the exact set value
   
   - Requires:
   It's necessary to configure the Design System with a theme or fatalError will be raised.
   
   DesignSystem().configure(with: AvailableTheme)
   */
  
  public enum Limit {
    case max9
    case max99
    case unlimited
    
    var maxValue: Int? {
      switch self {
      case .max9: return 9
      case .max99: return 99
      case .unlimited: return nil
      }
    }
    
    var text: String? {
      switch self {
      case .max9: return "9+"
      case .max99: return "99+"
      case .unlimited: return nil
      }
    }
  }
}

