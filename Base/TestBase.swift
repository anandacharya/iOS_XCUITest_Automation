
import Foundation
import XCTest

class TestBase: XCTestCase {
  
  var app = XCUIApplication()
  
  override func setUpWithError() throws {
    super.setUp()
    continueAfterFailure = false
    app.launch()
    print("Test execution started")
  }

  override func tearDownWithError() throws {
    super.tearDown()
    //Thread.sleep(forTimeInterval: 2)
    print("Test execution ended")
    app.terminate()
  }
  
  func verifyUIElementExists(_ type: XCUIElement.ElementType, withId id: String) {
    XCTAssert(app.descendants(matching: type)[id].exists)
  }
  
  func waitForElementToAppear(_ element: XCUIElement) -> Bool {
    let existsPredicate = NSPredicate(format: "exists == true")
    let expectation = XCTNSPredicateExpectation(predicate: existsPredicate,
                                                object: element)
    let result = XCTWaiter().wait(for: [expectation], timeout: 45)
    return result == .completed
  }
}
