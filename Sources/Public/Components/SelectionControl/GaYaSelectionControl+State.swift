//
//  GaYaSelectionControl+State.swift
//  NatDS
//
//  Created by Hayna.Cardoso on 16/12/24.
//  Copyright © 2024 Natura. All rights reserved.
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
