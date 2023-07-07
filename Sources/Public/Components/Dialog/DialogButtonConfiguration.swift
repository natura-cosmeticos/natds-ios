/// Struct with required configuration for dialog buttons
public struct DialogButtonConfiguration {
    let title: String
    let style: NatButton.Style
    let theme: AvailableTheme
    let action: () -> Void
}
