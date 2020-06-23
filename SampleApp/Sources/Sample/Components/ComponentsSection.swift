import UIKit

class ComponentsSection: SampleSection {
    var name = "Components"
    var items: [SampleItem.Type] = [
        AppBarViewController.self,
        TabItemViewController.self,
        TextFieldItemViewController.self,
        ValueTextHighlightItemViewController.self,
        ButtonsItemViewController.self,
        IconographyItemViewController.self,
        NavigationDrawerItemViewController.self,
        DividerViewController.self,
        ExpansionPanelViewController.self
    ]
}
