

import Foundation
import XCTest

extension TestBase {
  
  func thenUserEnterSms(sms : String) {
    XCTContext.runActivity(named: "Then User enters SMS") { _ in
        XCTAssertTrue(Common().waitForElementToAppear.self.app.staticTexts["SMS"])))
      let textField = self.app.textFields["smsTextField"]
      if textField.exists {
        textField.doubleTap()
        textField.typeText(sms)
        let testButton = self.app.buttons["CONFIRM"]
        testButton.tap()
      }
    }
  }
}

