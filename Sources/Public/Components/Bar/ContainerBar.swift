//
//  ContainerBar.swift
//  NatDS
//
//  Created by Hayna.Cardoso on 26/03/24.
//  Copyright © 2024 Natura. All rights reserved.
//

import Foundation
import UIKit

public class ContainerBar: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // A função setup não é mais necessária no contexto atual, pois as configurações serão gerenciadas pelo ViewController.

    public func addComponent(_ component: UIView) {
        component.translatesAutoresizingMaskIntoConstraints = false
        addSubview(component)

        NSLayoutConstraint.activate([
            component.leadingAnchor.constraint(equalTo: leadingAnchor),
            component.trailingAnchor.constraint(equalTo: trailingAnchor),
            component.topAnchor.constraint(equalTo: topAnchor),
            component.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

