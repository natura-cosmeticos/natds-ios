import UIKit

class DesignSection: SampleSection {
    var name = "Design Tokens"
    var items: [SampleItem.Type] = [
        ColorsViewController.self,
        SizeViewController.self,
        SpacingViewController.self,
        OpacityViewController.self
    ]
}
