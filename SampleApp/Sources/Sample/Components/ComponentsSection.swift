import UIKit

class ComponentsSection: SampleSection {
    var name = "Components"
    var items: [SampleItem.Type] = [
        ButtonsItemViewController.self,
        IconographyItemViewController.self,
        NavigationDrawerItemViewController.self
    ]
}
