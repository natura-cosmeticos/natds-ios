import Quick
import Nimble

@testable import NatDS

final class NatAvatarSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: NatAvatar!
        var initialsLabel: UILabel?
        var imageView: UIImageView?
        var iconImageView: UIImageView?
        
        func getItemsFromView() {
            initialsLabel = systemUnderTest.subviews
                .compactMap { $0 as? UILabel }
                .first
            
            imageView = systemUnderTest.subviews
                .compactMap { $0 as? UIImageView }
                .first
            
            iconImageView = systemUnderTest.subviews
                .compactMap { $0 as? UIImageView }
                .last
        }

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()

            systemUnderTest = NatAvatar(size: .medium)

            systemUnderTest.layoutIfNeeded()
            getItemsFromView()
        }

        describe("#init") {
            it("returns expected color for avatar") {
                expect(systemUnderTest.circleView.backgroundColor).to(equal(getUIColorFromTokens(\.colorPrimary)))
            }
            
            it("returns expected border radius for avatar") {
                expect(systemUnderTest.circleView.layer.cornerRadius).to(equal((systemUnderTest.size.value)/2))
            }
        }
        
        describe("#configure: initials") {
            beforeEach {
                systemUnderTest.configure(name: "Design System")
            }

            it("show initials label") {
                expect(initialsLabel?.isHidden).to(beFalse())
            }
            
            it("show only two characters on initials label") {
                expect(initialsLabel?.text?.count).to(equal(2))
            }
            
            it("returns expected color for initials label") {
                expect(initialsLabel?.textColor).to(equal(getUIColorFromTokens(\.colorOnPrimary)))
            }
            
            it("hides image view") {
                expect(imageView?.isHidden).to(beTrue())
            }
            
            it("hides icon view") {
                expect(iconImageView?.isHidden).to(beTrue())
            }
        }
        
        describe("#configure: image") {
            beforeEach {
                systemUnderTest.configure(image: UIImage())
            }

            it("shows image view") {
                expect(imageView?.isHidden).to(beFalse())
            }
            
            it("hides initials view") {
                expect(initialsLabel?.isHidden).to(beTrue())
            }
            
            it("hides icon view") {
                expect(iconImageView?.isHidden).to(beTrue())
            }
        }
        
        describe("#configure: nil image") {
            beforeEach {
                systemUnderTest.configure(image: nil)
            }
            
            it("shows default icon view as a fallback") {
                expect(iconImageView?.isHidden).to(beFalse())
            }
            
            it("hides image view") {
                expect(imageView?.isHidden).to(beTrue())
            }
            
            it("hides initials view") {
                expect(initialsLabel?.isHidden).to(beTrue())
            }
        }
        
        describe("#configure: icon") {
            beforeEach {
                systemUnderTest.configureWithDefaultIcon()
            }
            
            it("shows icon view") {
                expect(iconImageView?.isHidden).to(beFalse())
            }

            it("hides image view") {
                expect(imageView?.isHidden).to(beTrue())
            }
            
            it("hides initials view") {
                expect(initialsLabel?.isHidden).to(beTrue())
            }
            
            it("has the expected icon color") {
                expect(iconImageView?.tintedColor).to(equal(getUIColorFromTokens(\.colorOnPrimary)))
            }
        }
    }
}
