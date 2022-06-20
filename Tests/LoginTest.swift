

import Foundation
import XCTest

class LoginTest: TestBase {
  
  func testLoginTest(){
    /** Reset route and login **/
    givenUserIsOnLoginScreen(routeId: "a30072c2-9bb9-4168-83be-c24217b0b5a0")
    whenUserEnterDriverIdAndPressLogin(driverId: "9300722")
    /** Verify sms **/
    thenUserEnterSms(sms: "123456")
    /** Allow  location permission **/
    thenUserAllowLocationPermission()
    /** Signout **/
    thenUserSignOutFromRouteSelection()
  }
}
