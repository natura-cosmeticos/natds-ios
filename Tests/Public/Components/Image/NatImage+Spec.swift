import Quick
import Nimble

@testable import NatDS

final class NatImageSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: NatImage!

        describe("#init") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = StubTheme()

                systemUnderTest = NatImage()
            }

            it("returns an expected borderRadius") {
                systemUnderTest.configure(setBorderRadius: true)

                expect(systemUnderTest.layer.cornerRadius).to(equal(getTokenFromTheme(\.borderRadiusMedium)))
            }

            it("returns no borderRadius") {
                systemUnderTest.configure(setBorderRadius: false)

                expect(systemUnderTest.layer.cornerRadius).to(equal(0))
            }

            it("returns an expected overlay") {
                systemUnderTest.configure(setOverlay: true)
                let overlayLayer = systemUnderTest.subviews.last

                expect(overlayLayer?.backgroundColor?.cgColor)
                    .to(equal(NatColors
                                .onSurface
                                .withAlphaComponent(getTokenFromTheme(\.opacityMedium))
                                .cgColor
                                ))
            }

            it("returns no overlay") {
                systemUnderTest.configure(setOverlay: false)
                let overlayLayer = systemUnderTest.subviews.last

                expect(overlayLayer?.backgroundColor?.cgColor)
                    .to(equal( UIColor.clear.cgColor))
            }

            it("returns defaultImage as default") {
                let defaultImage = systemUnderTest.subviews.first

                expect(defaultImage).to(equal(systemUnderTest.defaultImageView))
            }

            it("returns defaultImage as fallback") {
                systemUnderTest.configure(setImage: UIImage(named: "worngImage"))

                let defaultImage = systemUnderTest.subviews
                    .compactMap { $0 as? UIImageView }
                    .first

                expect(defaultImage?.image).to(equal(systemUnderTest.defaultImageView.image))
            }

            it("returns set image") {
                systemUnderTest.configure(setImage: AssetsPath.iconOutlinedDefaultMockupBackground.rawValue)

                let setImage = systemUnderTest.subviews
                    .compactMap { $0 as? UIImageView }
                    .first

                expect(setImage?.image).to(equal(AssetsPath.iconOutlinedDefaultMockupBackground.rawValue))
            }

        }
    }
}
