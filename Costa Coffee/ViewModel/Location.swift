//
//  Location.swift
//  Costa Coffee
//
//  Created by Emil Vaklinov on 31/03/2021.
//

import Foundation

struct Location: Codable {
    let address: String
    let lat: Double
    let lng: Double
    let distance: Int
    let city: String
    let state: String
    let country: String
}
