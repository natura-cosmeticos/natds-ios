extension GaYaTag {
    /**
     Style represents styles values for the GaYaTag component.

        These are all allowed styles for a NatTag:
        - default (centered)
        - left
        - right
    */

    public struct Style {
        let applyStyle: (GaYaTag) -> Void

        public static var defaultAlert: GaYaTag.Style {
            .init { tag in
                GaYaTagStyle.applyAlert(position: .default, on: tag)
            }
        }

        public static var leftAlert: GaYaTag.Style {
            .init { tag in
                GaYaTagStyle.applyAlert(position: .left, on: tag)
            }
        }

        public static var rightAlert: GaYaTag.Style {
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
