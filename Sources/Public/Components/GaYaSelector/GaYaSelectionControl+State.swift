//
//  GaYaSelectionControl+State.swift
//  NatDS
//
//  Created by Hayna.Cardoso on 02/06/25.
//  Copyright © 2025 Natura. All rights reserved.
//

extension GaYaSelectionControl {
    enum Selection {
        case selected
        case unselected
    }

    enum State {
        case enabled(_ selection: Selection)
        case disabled
    }
}
