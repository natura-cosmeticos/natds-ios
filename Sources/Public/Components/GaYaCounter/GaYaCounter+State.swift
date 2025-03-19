//
//  GaYaCounter+State.swift
//  GaYa DS
//
//  Created by Hayna.Cardoso on 12/02/25.
//  Copyright © 2025 Natura. All rights reserved.
//

extension GaYaCounter {

    /**
     State represents state values for GaYaCounter component.

     These are all states allowed for a GaYaCounter:
     - enabled
     - disabled
     */

    public enum State {
        case enabled
        case disabled
    }
    
    public enum MinValue {
        case value0
        case value1
    }
}
