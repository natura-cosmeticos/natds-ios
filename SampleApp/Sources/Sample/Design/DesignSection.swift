import UIKit

class DesignSection: SampleSection {
    var name = "Design Tokens"
    var items: [SampleItem.Type] = [
        BorderRadiusViewController.self,
        ColorsViewController.self,
        SizeViewController.self,
        SpacingViewController.self,
        OpacityViewController.self,
        TipographyViewController.self
    ]
}
