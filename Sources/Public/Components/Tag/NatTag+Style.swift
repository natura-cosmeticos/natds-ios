extension NatTag {
    public struct Style {
        let applyStyle: (NatTag) -> Void

        public static var defaultAlert: NatTag.Style {
            .init(
                applyStyle: NatTagStyle.applyDefaultAlert
            )
        }
    }
}

enum NatTagStyle {
    static func applyDefaultAlert(on tag: NatTag) {
        tag.configure(path: getUIColorFromTokens(\.colorAlert), position: .default)
        tag.configure(textColor: getUIColorFromTokens(\.colorOnAlert))
    }
}
