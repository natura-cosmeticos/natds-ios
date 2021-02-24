import Quick
import Nimble

@testable import NatDS

final class NatAvatarSpec: QuickSpec {
    override func spec() {
        
        var systemUnderTest: NatAvatar!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()

            systemUnderTest = NatAvatar(size: .medium)
            systemUnderTest.layoutSubviews()
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
                let initialsLabel = systemUnderTest.subviews
                    .compactMap { $0 as? UILabel }
                    .first
                expect(initialsLabel?.isHidden).to(beFalse())
            }
            
            it("show only two characters on initials label") {
                let initialsLabel = systemUnderTest.subviews
                    .compactMap { $0 as? UILabel }
                    .first
                expect(initialsLabel?.text?.count).to(equal(2))
            }
            
            it("returns expected color for initials label") {
                let initialsLabel = systemUnderTest.subviews
                    .compactMap { $0 as? UILabel }
                    .first

                expect(initialsLabel?.textColor).to(equal(getUIColorFromTokens(\.colorOnPrimary)))
            }
            
            it("hides image view") {
                let imageView = systemUnderTest.subviews
                    .compactMap { $0 as? UIImageView }
                    .first
                expect(imageView?.isHidden).to(beTrue())
            }
            
            it("hides icon view") {
                let iconView = systemUnderTest.subviews
                    .compactMap { $0 as? IconView }
                    .first
                expect(iconView?.isHidden).to(beTrue())
            }
        }
        
        describe("#configure: image") {
            beforeEach {
                systemUnderTest.configure(image: UIImage())
            }

            it("shows image view") {
                let imageView = systemUnderTest.subviews
                    .compactMap { $0 as? UIImageView
                    }
                    .first
                expect(imageView?.isHidden).to(beFalse())
            }
            
            it("hides initials view") {
                let initialsLabel = systemUnderTest.subviews
                    .compactMap { $0 as? UILabel }
                    .first
                expect(initialsLabel?.isHidden).to(beTrue())
            }
            
            it("hides icon view") {
                let iconView = systemUnderTest.subviews
                    .compactMap { $0 as? IconView }
                    .first
                expect(iconView?.isHidden).to(beTrue())
            }
        }
        
        describe("#configure: icon") {
            beforeEach {
                systemUnderTest.configureWithIcon()
            }
            
            it("shows icon view") {
                let iconView = systemUnderTest.subviews
                    .compactMap { $0 as? IconView }
                    .first
                expect(iconView?.isHidden).to(beFalse())
            }
            
            it("has the expected icon color") {
                let iconView = systemUnderTest.subviews
                    .compactMap { $0 as? IconView }
                    .first
                expect(iconView?.iconLabel.textColor).to(equal(getUIColorFromTokens(\.colorOnPrimary)))
            }

            it("hides image view") {
                let imageView = systemUnderTest.subviews
                    .compactMap { $0 as? UIImageView
                    }
                    .first
                expect(imageView?.isHidden).to(beTrue())
            }
            
            it("hides initials view") {
                let initialsLabel = systemUnderTest.subviews
                    .compactMap { $0 as? UILabel }
                    .first
                expect(initialsLabel?.isHidden).to(beTrue())
            }
        }
    }
}
