
import Foundation
import XCTest

extension TestBase{

  public func resetRoute(routeId : String){
    XCTContext.runActivity(named: "Resetting the route \(routeId)") { _ in
      let url:URL  = URL(string: "https://****************.*********..net/api/ResetRoute?routeId="+routeId+"&resetFirebase=true")!
      print(url)
      URLSession.shared.dataTask(with: url) { data, response, error in
      if error == nil {
         print("route has been reset")
        } else {
              print(error ?? "error in resetting the route")
            }
      }.resume()
    }
  }
}
