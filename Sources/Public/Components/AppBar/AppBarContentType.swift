/// AppBarContentType represents the allowed content types for the AppBar Top component
/// The component is configured using UINavigationController and UIViewController extensions.
public enum AppBarContentType {
    case text(String)
    case media(UIImage?)
    case logo(NatLogo)
}
