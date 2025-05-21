import Foundation
import XCTest

extension XCUIElement {
    @discardableResult
    func waitForElementToBecomeHittable(_ timeout: TimeInterval = 1) -> Bool {
        return waitForExistence(timeout: timeout)
    }
    
    func forceTapElement() {
        if self.isHittable {
            self.tap()
            Thread.sleep(forTimeInterval: 0.2)
            let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx:0.5, dy:0.5))
            coordinate.tap()
        }
        else {
            let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx:0.5, dy:0.5))
            coordinate.tap()
        }
    }
}
