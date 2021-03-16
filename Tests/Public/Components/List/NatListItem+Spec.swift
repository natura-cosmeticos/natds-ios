import Quick
import Nimble

@testable import NatDS

final class ListItemSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: NatListItemCell!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()

            systemUnderTest = NatListItemCell()
            systemUnderTest.frame = CGRect(x: 0, y: 0, width: 320, height: 48)
        }
        
        describe("#init") {
            it("is not selected") {
                expect(systemUnderTest.isSelected).to(beFalse())
            }

            it("returns default onClick: off") {
                expect(systemUnderTest.onClick).to(beFalse())
            }
            
            it("returns default divider: .none") {
                
                let dividerView = systemUnderTest.contentView.subviews
                    .compactMap { $0 as? Divider }
                    .first
                expect(dividerView).to(beNil())
            }
        }
        
        describe("#configure(onClick:)") {
            beforeEach {
                systemUnderTest.configure(onClick: true)
            }
            
            it("sets onClick to true") {
                expect(systemUnderTest.onClick).to(beTrue())
            }
        }
        
        describe("#configure(divider:)") {
            beforeEach {
                systemUnderTest.configure(divider: .fullBleed)
            }
            
            it("adds a divider to the cell") {
                let dividerView = systemUnderTest.contentView.subviews
                    .compactMap { $0 as? Divider }
                    .first
                expect(dividerView).toNot(beNil())
            }
        }
        
        describe("#configureRemoveDivider") {
            beforeEach {
                systemUnderTest.configure(divider: .fullBleed)
                systemUnderTest.configureRemoveDivider()
            }
            
            it("removes divider from cell") {
                let dividerView = systemUnderTest.contentView.subviews
                    .compactMap { $0 as? Divider }
                    .first
                expect(dividerView).to(beNil())
            }
        }
    }
}
