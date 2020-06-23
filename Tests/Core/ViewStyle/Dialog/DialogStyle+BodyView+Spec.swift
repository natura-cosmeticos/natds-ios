//import Quick
//import Nimble
//
//@testable import NatDS
//
//final class DialogStyleBodyViewSpec: QuickSpec {
//    override func spec() {
//        var systemUnderTest: DialogStyle.BodyView!
//
//        beforeEach {
//            DesignSystem().configure(with: .theBodyShop)
//            systemUnderTest = .init()
//        }
//
//        describe("#init") {
//            it("sets as a label as subview") {
//                let expectedView = systemUnderTest.subviews.first as? UILabel
//
//                expect(expectedView).toNot(beNil())
//            }
//
//            it("does not set any content to label") {
//                let label = systemUnderTest.subviews.first as? UILabel
//
//                expect(label?.attributedText).to(beNil())
//            }
//        }
//
//        describe("#configure(body: String)") {
//            beforeEach {
//                systemUnderTest.configure(body: "Stub Text")
//            }
//
//            it("sets a value to title") {
//                let label = systemUnderTest.subviews.first as? UILabel
//
//                expect(label?.attributedText).toNot(beNil())
//            }
//        }
//    }
//}
