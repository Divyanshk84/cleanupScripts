import XCTest
@testable import smartInvertCheck

final class smartInvertCheckUITests: XCTestCase {
    func findElement(named name: String, in app: XCUIApplication) -> XCUIElement? {
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", name)
        for element in app.descendants(matching: .any).allElementsBoundByIndex {
            print("Type: \(element.elementType.rawValue), Label: \(element.label)")
        }

        let candidates: [XCUIElement] = [
            app.staticTexts.containing(predicate).element(boundBy: 0),
            app.buttons.containing(predicate).element(boundBy: 0),
            app.otherElements.containing(predicate).element(boundBy: 0)
        ]

        logger(status: .TestInfo, title: #function, Value: "Element with name '\(name)' not found in any known type")
        return nil
    }

    func testExample() throws {
        var app = XCUIApplication(bundleIdentifier: "com.apple.mobilephone")
        
            let contactElement = app.buttons.containing(Constants.CONTACTS.containsLabelPredicate()).element(boundBy: 0)
            let editButton = app.buttons.containing(Constants.EDIT.containsLabelPredicate()).element(boundBy: 0)
            let ignoreAllButton = app.buttons.containing(Constants.IGNORE_ALL.containsLabelPredicate()).element(boundBy: 0)
        let ignoreAllText = app.staticTexts.containing(Constants.IGNORE_ALL.containsLabelPredicate()).element(boundBy: 0)
            let deleteContactButton = app.buttons.containing(Constants.DELETE_CONTACT.containsLabelPredicate()).element(boundBy: 0)
//            let mycardElement = app.otherElements.containing(Constants.MY_CARD.containsLabelPredicate()).element
        let myCardPredicate = NSPredicate(format: "label CONTAINS[c] %@", "My Card")
        let myCardElement = app.otherElements.matching(myCardPredicate).firstMatch

        let dontAllowElement = app.staticTexts.containing(Constants.DONT_ALLOW.containsLabelPredicate()).element(boundBy: 0)

        app.launch()
        app.terminate()
        app.launch()
        
            
            logger(status: .TestStarted, title: #function, Value: "My contact card cleanup started")

            if dontAllowElement.waitForElementToBecomeHittable() {
                dontAllowElement.tap()
                logger(status: .TestInfo, title: #function, Value: "Don't Allow button pressed")
            } else {
                logger(status: .TestInfo, title: #function, Value: "Don't Allow button not hittable")
            }
         // Cell at index 1

            if contactElement.waitForElementToBecomeHittable() {
                contactElement.tap()
                logger(status: .TestInfo, title: #function, Value: "Contact button pressed")
                let name = "My Card"
                if let nameElement = findElement(named: name, in: app) {
                    // Use nameElement safely
                    XCTAssertTrue(nameElement.exists)
                    nameElement.forceTapElement()
//                }
//                else {
//                    XCTFail("Element with name '\(name)' not found in any known type")
//                }
//                if mycardElement.waitForElementToBecomeHittable() {
//                    mycardElement.tap()
                    logger(status: .TestInfo, title: #function, Value: "My Card button pressed")

                    sleep(3)
                    if myCardElement.waitForElementToBecomeHittable() {
                        myCardElement.tap()
                        logger(status: .TestInfo, title: #function, Value: "My Card forced button pressed again after sleep")
                    }

                    if editButton.waitForElementToBecomeHittable() {
                        editButton.tap()
                        logger(status: .TestInfo, title: #function, Value: "Edit button pressed")

                        app.swipeUp()
                        logger(status: .TestInfo, title: #function, Value: "Swipe 1")

                        app.swipeUp()
                        logger(status: .TestInfo, title: #function, Value: "Swipe 2")

                        app.swipeUp()
                        logger(status: .TestInfo, title: #function, Value: "Swipe 3")

                        if ignoreAllText.waitForElementToBecomeHittable() {
                            ignoreAllText.tap()
                            logger(status: .TestInfo, title: #function, Value: "Ignore All main button pressed")

                            if ignoreAllButton.waitForElementToBecomeHittable() {
                                ignoreAllButton.tap()
                                logger(status: .TestInfo, title: #function, Value: "Ignore All alert button pressed")
                            } else {
                                logger(status: .TestInfo, title: #function, Value: "Ignore All alert button not hittable")
                            }
                        } else {
                            logger(status: .TestInfo, title: #function, Value: "Ignore All main button not hittable")
                        }

                        if deleteContactButton.waitForElementToBecomeHittable() {
                            deleteContactButton.tap()
                            logger(status: .TestInfo, title: #function, Value: "Delete Contact button pressed")

                            if deleteContactButton.waitForElementToBecomeHittable() {
                                deleteContactButton.tap()
                                logger(status: .TestInfo, title: #function, Value: "Delete Contact alert button pressed")
                            } else {
                                logger(status: .TestInfo, title: #function, Value: "Delete Contact alert button not hittable")
                            }
                        } else {
                            logger(status: .TestInfo, title: #function, Value: "Delete Contact button not hittable")
                        }
                    } else {
                        logger(status: .TestInfo, title: #function, Value: "Edit button not hittable")
                    }
                } else {
                    logger(status: .TestInfo, title: #function, Value: "Element with name '\(name)' not found in any known type")
                    XCTFail("Element with name '\(name)' not found in any known type")
                }
            } else {
                logger(status: .TestInfo, title: #function, Value: "Contact button not hittable")
            }
        
    }
}
