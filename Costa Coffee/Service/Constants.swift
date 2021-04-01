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
    
 
    
    static let venueURLString = "https://api.foursquare.com/v2/venues/search"
    static let imageURLString = "https://api.foursquare.com/v2/venues/"

    static let CLIENT_ID = "QQBSD4K1LFOV132B4PEV04QDJC3RAL2KVGV1E05KPLZT2KNW"
    static let CLIENT_KEY = "KB1Z4RF0DIKYM1Z4IHOOZBS0RSGGYGVV45XIFYPE4ORKYKYJ"
    
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
