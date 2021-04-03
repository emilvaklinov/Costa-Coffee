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
    
//    static let CLIENT_ID = "M5T2LVOCWNIJ0GB1EQG5BCTWSYTPD4R4D1RLYGELAZOCUWBM"
//    static let CLIENT_KEY = "ROP44BIHYBA401DWWMJQT1R53WV2TJ1231WMUBDK1FVZH3OO"

    
    static let venueURLString = "https://api.foursquare.com/v2/venues/search"
    static let imageURLString = "https://api.foursquare.com/v2/venues/"

    static let CLIENT_ID = "2P0PR3KIQDZM0WYDRZB1VKLDVKGICILZQZOBKE5JYG2PUOBH"
    static let CLIENT_KEY = "LZPVRV5IEITTMNVSIAS0TLNTCP4PFBQNTK4AFGDLV0MKBMCF"
    
    static let LOCATION = "51.5085300,-0.1257400"
    static let CATEGORY_TYPE = "coffee"
    static let DEFAULT_DATE = "20210331"
    
    static func getCompleteURL() -> String {
        return "\(venueURLString)?client_id=\(CLIENT_ID)&client_secret=\(CLIENT_KEY)&query=\(CATEGORY_TYPE)&limit=15&v=\(DEFAULT_DATE)&ll="
    }
    
    static func getImageCompleteURL(venueID: String, limit: Int) -> String {
        return "\(imageURLString)"+"\(String(venueID))/photos?client_id=\(CLIENT_ID)&client_secret=\(CLIENT_KEY)&v=\(DEFAULT_DATE)&limit=\(limit)"
    }
}
