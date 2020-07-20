import UIKit

class ComponentsSection: SampleSection {
    var name = "Components"
    var items: [SampleItem.Type] = [
        AppBarViewController.self,
        BadgeViewController.self,
        ButtonsItemViewController.self,
        DialogItemViewController.self,
        DividerViewController.self,
        ExpansionPanelViewController.self,
        IconographyItemViewController.self,
        LogoItemViewController.self,
        TabItemViewController.self,
        TextFieldItemViewController.self,
        NavigationDrawerItemViewController.self,
        ShortcutItemViewController.self,
        ValueTextHighlightItemViewController.self
    ]
}
