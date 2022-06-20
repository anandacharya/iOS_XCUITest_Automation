
import Foundation
import XCTest

extension TestBase {
  
  func givenUserIsOnLoginScreen(routeId : String) {
    resetRoute(routeId: routeId)
    XCTContext.runActivity(named: "Given User is on Login Screen") { _ in
      addUIInterruptionMonitor(withDescription: "Notifications") { (alert) -> Bool in
      let alertButton = alert.buttons["Allow"]
      if alertButton.exists {
          alertButton.tap()
           return true
        }
          return false
      }
           app.tap()
      
      XCTAssertTrue(Common().waitForElementToAppear(self.app.staticTexts["Login"]))
    }
  }

  func givenUserIsOnLoginScreen() {
    XCTContext.runActivity(named: "Given User is on Login Screen") { _ in
      addUIInterruptionMonitor(withDescription: "Notifications") { (alert) -> Bool in
      let alertButton = alert.buttons["Allow"]
      if alertButton.exists {
          alertButton.tap()
           return true
        }
          return false
      }
           app.tap()
      
      XCTAssertTrue(Common().waitForElementToAppear(self.app.staticTexts["Login"]))
    }
  }
  
  func whenUserEnterUserIdAndPressLogin(UserId : String){
    XCTContext.runActivity(named: "When Driver enters Driver id \(driverId)") { _ in
      let testButton = self.app.buttons["LOGIN"]
      let textField = self.app.textFields["loginTextField"]
      textField.tap()
      textField.typeText(driverId)
      XCTAssertTrue(testButton.isEnabled)
      testButton.tap()
    }
  }
}
