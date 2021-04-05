//
//  CoreLocationTests.swift
//  Costa CoffeeTests
//
//  Created by Emil Vaklinov on 05/04/2021.
//

import XCTest
import CoreLocation
@testable import Costa_Coffee

class CoreLocationTests: XCTestCase {

    func test_view_model_updates_latitude_and_longitude_properties() {
        let locations: [CLLocation] = [CLLocation(latitude: 12, longitude: -10)]
      
      let viewModel = LocationViewModel()
      
      viewModel.locationManager(CLLocationManager(), didUpdateLocations: locations)
      
      XCTAssertEqual(12, viewModel.userLatitude)
      XCTAssertEqual(-10, viewModel.userLongitude)
    }
  }
