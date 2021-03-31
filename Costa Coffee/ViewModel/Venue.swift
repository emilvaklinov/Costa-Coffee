//
//  Venue.swift
//  Costa Coffee
//
//  Created by Emil Vaklinov on 31/03/2021.
//

import Foundation

struct Venue: Codable {
    let id: String
    let name: String
    let location: Location
    let referralId: String
    let hasPerk: Bool
}
