

import Foundation
import XCTest

extension TestBase {

  func thenUserAllowLocationPermission() {
    XCTContext.runActivity(named: "Then User allows location permission") { (alert) -> Bool in
     Thread.sleep(forTimeInterval: 1)
     let button = self.app.buttons["ALLOW LOCATION"]
     if button.exists{
     button.firstMatch.tap()

     let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
     let allowBtn = springboard.buttons["Allow While Using App"]
     if allowBtn.waitForExistence(timeout: 5) {
      allowBtn.tap()
      }
    return true
    }
   return false
   }
  }
 }
