//
//  GaYaSelectorProtocol.swift
//  NatDS
//
//  Created by Hayna.Cardoso on 02/06/25.
//  Copyright © 2025 Natura. All rights reserved.
//

public typealias SelectionHandler = (Bool) -> Void

protocol GaYaSelector: UIControl, Pulsable {
    var isHapticFeedbackEnabled: Bool { get set }
    var isIndeterminate: Bool { get set }
    var labelComponent: String? { get set }
    var isGrouped: Bool { get set }
    var groupId: Int { get set }
    var handler: SelectionHandler? { get set }
    var theme:AvailableTheme { get set }
}
