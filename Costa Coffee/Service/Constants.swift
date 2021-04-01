//
//  Constants.swift
//  Costa Coffee
//
//  Created by Emil Vaklinov on 31/03/2021.
//

import UIKit
import CoreLocation
import SwiftUI

class Constants {
    
//    static let CLIENT_ID = "D51EXKQ2L2ITIGPSUZCEY44MGRLOQTUEYEZQOA3QKXOSWGMY"
//    static let CLIENT_KEY = "FJ2X4B3MAFWGY0WPRCN11QECCBPCQE5TSO14YNOP5WZM4NGQ"

    
    static let venueURLString = "https://api.foursquare.com/v2/venues/search"
    static let imageURLString = "https://api.foursquare.com/v2/venues/"

    static let CLIENT_ID = "2P0PR3KIQDZM0WYDRZB1VKLDVKGICILZQZOBKE5JYG2PUOBH"
    static let CLIENT_KEY = "ZT50LHZD1NDK5TBFLUHLIEYDJNH3K5GFVONHWWYDKLTCGCIB"
    
//    static let LOCATION = "51.5085300,-0.1257400"
    static let CATEGORY_TYPE = "coffee"
    static let DEFAULT_DATE = "20210331"
    
    static func getCompleteURL() -> String {
        return "\(venueURLString)?client_id=\(CLIENT_ID)&client_secret=\(CLIENT_KEY)&query=\(CATEGORY_TYPE)&limit=15&v=\(DEFAULT_DATE)&ll="
    }
    
    static func getImageCompleteURL(venueID: String, limit: Int) -> String {
        return "\(imageURLString)"+"\(String(venueID))/photos?client_id=\(CLIENT_ID)&client_secret=\(CLIENT_KEY)&v=\(DEFAULT_DATE)&limit=\(limit)"
    }
}
