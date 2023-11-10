# Image
> Informs the user of image content with possible resources for greater interaction

<br>

## Properties

| Property           | Values                         | Status            |
| --------------     | -------------------------      | ----------------- |
| Variant             | Standard, Highlight      | ✅  Available     |
| Radius          | None, Medium, Circle  | ✅  Available     |
| Fade         | Top, Bottom, Left, Right        | ✅  Available     |
| Fallback          | URL                    | ✅  Available     |

<br>

## Technical Usages Examples

<p align="center">
  <img alt="Logo 1" src="./images/image1.png" width="30%"> 
&nbsp;
  <img alt="Logo 2" src="./images/image2.png" width="30%">
</p>

<br>

```swift
    private var natImageView: NatImage = {
        let view = NatImage()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    natImageView.configure(variant: viewModel.variant)
    natImageView.configureRadius(viewModel.radius)
    natImageView.configure(setImage: UIImage(named: "ImageAreaPlaceholder"))
    natImageView.configure(contentMode: .scaleAspectFill)
    natImageView.configureFade(.top)
```
