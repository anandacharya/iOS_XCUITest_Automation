
import Foundation
import XCTest

extension TestBase{
  
  public func sendRequest() -> String? {
    
    let session = URLSession.shared
    var driver: String?
    let sem = DispatchSemaphore.init(value: 0)

//    let params = ["key" : "value"] as Dictionary<String, String>
//    let token = ""
//    var body = try? JSONSerialization.data(withJSONObject: params, options: [])
    var request = URLRequest(url: URL(string: "https://*************.********.net/api/GenerateRoute")!)
    request.httpMethod = "GET"
//    request.httpBody = body
//    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//    request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

    let task = session.dataTask(with: request) { data, response, error in
      defer { sem.signal() }

      if let error = error {
         print("Error -> \(error)")
         return
        }
      let dataReceived = data
                
      do {
          let result = try JSONDecoder().decode(Response.self, from: dataReceived!)
          print (result.routeId)
          print (result.driverId)
          driver = result.driverId
       }
        catch {
          print ("failed to convert \(error.localizedDescription)")
        }
      }
    task.resume()

    // This line will wait until the semaphore has been signaled
    // which will be once the data task has completed
    sem.wait()
    return driver
  }
}

struct Response: Codable {
  let routeId: String
  let driverId: String
}
