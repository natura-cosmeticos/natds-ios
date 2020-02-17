import UIKit

class ComponentsSection: SampleSection {
    var name = "Components"
    var items: [SampleItem.Type] = [
        TextFieldItemViewController.self,
        ValueTextHighlightItemViewController.self,
        ButtonsItemViewController.self,
        IconographyItemViewController.self,
        NavigationDrawerItemViewController.self
    ]
}
