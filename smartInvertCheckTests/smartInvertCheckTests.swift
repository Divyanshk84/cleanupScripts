import XCTest
@testable import smartInvertCheck

final class smartInvertCheckTests: XCTestCase {
    
    func testExample() throws {
        var app = XCUIApplication(bundleIdentifier: "com.apple.Preferences")
        app.launch()
        app.terminate()
        app.launch()
        if UIDevice.current.userInterfaceIdiom == .phone{
            logger(status: .TestStarted, title: #function, Value: "Accessibility cleanup started")
            var counter = 5
            let accessibilityElement = app.staticTexts.containing(Constants.ACCESSIBILITY.containsLabelPredicate()).element(boundBy: 0)

            while true && counter > 0 {
                if accessibilityElement.exists {
                    break
                }
                if SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(version: "18.0"){
                    let start = app.coordinate(withNormalizedOffset: CGVector(dx: 0.2, dy: 0.99))
                    let end = app.coordinate(withNormalizedOffset: CGVector(dx: 0.2, dy: 0.2))
                    
                    end.press(forDuration: 0.1, thenDragTo: start)
                }else{
                    app.swipeDown()
                }
                counter = counter - 1
            }
            if accessibilityElement.waitForElementToBecomeHittable(){
                accessibilityElement.tap()
                let smartInvertElement =  app.staticTexts.containing(Constants.SMART_INVERT.containsLabelPredicate()).element(boundBy: 0)
                if smartInvertElement.waitForElementToBecomeHittable(){
                    smartInvertElement.tap()
                    if  smartInvertElement.value as! String == "1" {
                        return XCTFail(XCTLog(status: .TestFailed, title: #function, Value: "Smart Invert is open"))
                    }
                }
            }
            else{
                logger(status: .TestFailed, title: #function, Value: "Accessibility cleanup failed")
                return XCTFail(XCTLog(status: .TestFailed, title: #function, Value: "Accessibility cleanup failed"))
            }
        }else{
            logger(status: .TestStarted, title: #function, Value: "Accessibility cleanup started")
            let accessibilityElement = app.staticTexts.containing(Constants.ACCESSIBILITY.containsLabelPredicate()).element(boundBy: 0)
            var counter = 5
            while true && counter > 0 {
                if accessibilityElement.exists {
                    break
                }
                if SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(version: "18.0"){
                    let start = app.coordinate(withNormalizedOffset: CGVector(dx: 0.2, dy: 0.99))
                    let end = app.coordinate(withNormalizedOffset: CGVector(dx: 0.2, dy: 0.2))
                    
                    end.press(forDuration: 0.1, thenDragTo: start)
                }else{
                    app.swipeDown()
                }
                counter = counter - 1
            }
            if accessibilityElement.waitForElementToBecomeHittable(){
                accessibilityElement.tap()
                let smartInvertElement =  app.staticTexts.containing(Constants.SMART_INVERT.containsLabelPredicate()).element(boundBy: 0)
                if smartInvertElement.waitForElementToBecomeHittable(){
                    smartInvertElement.tap()
                    if  smartInvertElement.value as! String == "1" {
                        return XCTFail(XCTLog(status: .TestFailed, title: #function, Value: "Smart Invert is open"))
                    }
                }
            }
            else{
                logger(status: .TestFailed, title: #function, Value: "Accessibility cleanup failed")
                return XCTFail(XCTLog(status: .TestFailed, title: #function, Value: "Accessibility cleanup failed"))
            }
        }
    }
}
