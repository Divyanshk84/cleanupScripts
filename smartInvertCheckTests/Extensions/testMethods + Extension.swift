import XCTest

extension smartInvertCheckUITests {
    func logger(status: TestStatus,title: String,Value: String){
        NSLog("\(status.rawValue) : \(title) : \(Value)");
    }
    
    func XCTLog(status: TestStatus,title: String,Value: String) -> String{
        return "\(status.rawValue) : \(title) : \(Value)"
    }
    
    func getIndexOftheExistingElelemntFromGivenElements(_ elements: [XCUIElement], timeOut: TimeInterval = 20.0) -> (Bool, Int?) {
        let startTime = Date.timeIntervalSinceReferenceDate
        while true {
            for i in 0 ..< elements.count {
                if Date.timeIntervalSinceReferenceDate - startTime > timeOut {
                    return (false, nil)
                } else {
                    if elements[i].exists {
                        return (true, i)
                    } else {
                        continue
                    }
                }
            }
            CFRunLoopRunInMode(.defaultMode, 0.1, false)
        }
    }
    
    func waitUntilElementExists(element: XCUIElement, timeOut: TimeInterval = 5.0) -> Bool {
        let startTime = Date.timeIntervalSinceReferenceDate
        while !element.exists {
            if Date.timeIntervalSinceReferenceDate - startTime > timeOut {
                return false
            }
            CFRunLoopRunInMode(.defaultMode, 0.1, false)
        }
        return true
    }
    
    func waitUntilOneOfTheElementsExists(elements: [XCUIElement], timeOut: TimeInterval = 3.0) -> (Bool, XCUIElement?) {
        let startTime = Date.timeIntervalSinceReferenceDate
        while true {
            for element in elements {
                if Date.timeIntervalSinceReferenceDate - startTime > timeOut {
                    return (false, nil)
                } else {
                    if element.exists {
                        return (true, element)
                    } else {
                        continue
                    }
                }
            }
            CFRunLoopRunInMode(.defaultMode, 0.1, false)
        }
    }
    
    /*
     Returns the list of available apps on a particular device which needs location privacy settings to be reset.
     **/
    func getAvailableAppsToClearLocationPrivacy(on currentApp: XCUIApplication) -> Set<String> {
        let appsToCheckAailability = ["Camera", "Maps", "Chrome", "App Store", "Safari"]
        var availableApps: Set<String> = []
        let startTime = Date.timeIntervalSinceReferenceDate
        let timeOut: TimeInterval = 3.0
        while true {
            for app in appsToCheckAailability {
                if Date.timeIntervalSinceReferenceDate - startTime > timeOut {
                    return availableApps
                } else {
                    let appPredicate = NSPredicate(format: "label CONTAINS[c] %@", app)
                    if currentApp.tables.staticTexts.containing(appPredicate).element(boundBy: 0).exists {
                        availableApps.insert(app)
                    } else {
                        continue
                    }
                }
            }
            CFRunLoopRunInMode(.defaultMode, 0.1, false)
        }
    }
    
}
