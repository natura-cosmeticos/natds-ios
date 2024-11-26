//
//  GaYaTag+Style.swift
//  NatDS
//
//  Created by Hayna.Cardoso on 12/11/24.
//  Copyright © 2024 Natura. All rights reserved.
//

import Foundation

extension GaYaTag {

    public struct Style {
        let applyStyle: (GaYaTag) -> Void

        public static var `default`: GaYaTag.Style {
            .init { tag in
                GaYaTagStyle.applyAlert(position: .default, on: tag)
            }
        }

        public static var left: GaYaTag.Style {
            .init { tag in
                GaYaTagStyle.applyAlert(position: .left, on: tag)
            }
        }

        public static var right: GaYaTag.Style {
            .init { tag in
                GaYaTagStyle.applyAlert(position: .right, on: tag)
            }
        }
    }
}

enum GaYaTagStyle {
    static func applyAlert(position: GaYaTag.Position, on tag: GaYaTag) {
        tag.configure(path: tag.color.tag, position: position)
        tag.configure(textColor: tag.color.label)
        tag.configure(iconColor: tag.color.label)
    }
}
