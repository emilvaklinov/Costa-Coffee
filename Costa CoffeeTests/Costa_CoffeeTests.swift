//
//  Costa_CoffeeTests.swift
//  Costa CoffeeTests
//
//  Created by Emil Vaklinov on 31/03/2021.
//

import XCTest
@testable import Costa_Coffee

class Costa_CoffeeTests: XCTestCase {

    var sut: URLSession!
      
      override func setUp() {
          super.setUp()
          sut = URLSession(configuration: .default)
      }
      
      override func tearDown() {
          sut = nil
          super.tearDown()
      }
    
       //  Asynchronous test: success fast, failure slow
        func testValidCallToGetsHTTPStatusCode200() {
            // given
            let url = URL(string: "https://api.foursquare.com/v2/venues/5bd1ba2046e1b6002c83e5e4/photos?client_id=QQBSD4K1LFOV132B4PEV04QDJC3RAL2KVGV1E05KPLZT2KNW&client_secret=KB1Z4RF0DIKYM1Z4IHOOZBS0RSGGYGVV45XIFYPE4ORKYKYJ&v=20210331&limit=1")
            // 1
            let promise = expectation(description: "Status code: 200")
    
            // when
            let dataTask = sut.dataTask(with: url!) { data, response, error in
                // then
                if let error = error {
                    XCTFail("Error: \(error.localizedDescription)")
                    return
                } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    if statusCode == 200 {
                        // 2
                        promise.fulfill()
                    } else {
                        XCTFail("Status code: \(statusCode)")
                    }
                }
            }
            dataTask.resume()
            // 3
            wait(for: [promise], timeout: 5)
        }
    
    // Asynchronous test: faster fail
     func testCallToCompletes() {
         // given
         let url = URL(string: "https://api.foursquare.com/v2/venues/search?client_id=QQBSD4K1LFOV132B4PEV04QDJC3RAL2KVGV1E05KPLZT2KNW&client_secret=KB1Z4RF0DIKYM1Z4IHOOZBS0RSGGYGVV45XIFYPE4ORKYKYJ&query=coffee&limit=15&v=20210331&ll=51.5085300,-0.1257400")
         // 1
         let promise = expectation(description: "Completion handler invoked")
         var statusCode: Int?
         var responseError: Error?
 
         // when
         let dataTask = sut.dataTask(with: url!) { data, response, error in
             statusCode = (response as? HTTPURLResponse)?.statusCode
             responseError = error
             // 2
             promise.fulfill()
         }
         dataTask.resume()
         // 3
         wait(for: [promise], timeout: 5)
 
         // then
         XCTAssertNil(responseError)
         XCTAssertEqual(statusCode, 200)
     }
    
}
