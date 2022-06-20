

import Foundation
import XCTest

extension TestBase {
  
  func thenUserSelectRoute(){
     XCTContext.runActivity(named: "Then User Select Route") { _ in
        XCTAssertTrue(waitForElementToAppear(self.app.staticTexts["SELECT"]))
        self.app.buttons["SELECT"].element.tap()
    }
  }
  
  func thenUserSignOutFromRouteSelection(){
    XCTContext.runActivity(named: "Then User Signs Out from route selection screen") { _ in
        XCTAssertTrue(waitForElementToAppear(self.app.staticTexts["SELECT"]))
      app.navigationBars["Run Selection"].children(matching: .button).element.tap()
      app.alerts.scrollViews.otherElements.buttons["Sign Out"].tap()
      XCTAssertTrue(waitForElementToAppear(self.app.staticTexts["LOGIN"]))
    }
  }
}
