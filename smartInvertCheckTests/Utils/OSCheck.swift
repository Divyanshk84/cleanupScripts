import Foundation
import XCTest
import UIKit

func SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version, options: .numeric) != .orderedAscending
}

func SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version, options: .numeric) != .orderedDescending
}

func getSwitchWithLabel(label: String,app: XCUIApplication) -> XCUIElement?{
    for toggle in app.switches.allElementsBoundByIndex {
        print(toggle)
       
        var toggleLabel = ""
        toggleLabel = toggle.label.lowercased()
        print("toggleLabel == toggle.label \(toggleLabel == toggle.label)  \(toggleLabel == label)")
        if toggleLabel == label.lowercased() {
            return toggle
        } else {
            continue
        }
    }
    return nil
}
