//
//  Response.swift
//  Costa Coffee
//
//  Created by Emil Vaklinov on 31/03/2021.
//

import Foundation


struct Results: Codable {
    let response: Response
}

struct Response: Codable {
    let venues: [Venue]
}

