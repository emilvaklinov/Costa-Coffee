//
//  APIService.swift
//  Costa Coffee
//
//  Created by Emil Vaklinov on 31/03/2021.
//

import Foundation
import CoreLocation
import SwiftUI

class APIService {
    
    @ObservedObject var locationManager = LocationManager()

    var userLatitude: String {
        return "\(String(describing: locationManager.lastLocation?.coordinate.latitude))"
        }

    var userLongitude: String {
        return "\(String(describing: locationManager.lastLocation?.coordinate.longitude))"
        }
    
    func fetchData(callback: @escaping ([Venue]?)-> Void) {
        let queryLocation = "51.5085300,-0.1257400"
//        let queryLocation = "\(userLatitude), \(userLongitude)"
        let urlString = Constants.getCompleteURL() + "\(queryLocation)"
        guard let url = URL(string: urlString ) else {
            print("url parsing failed")
            callback(nil)
            return
        }
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                print(err.localizedDescription)
                callback(nil)
                return
            }
            guard let d = data else {
                print("data is empty")
                callback(nil)
                return
            }
            do {
                let res = try JSONDecoder().decode(Results.self, from: d)
                callback(res.response.venues)
            }catch{
                print(error.localizedDescription)
                callback(nil)
            }
        }
        session.resume()
    }
    
    
    func fetchVenueDetail(){
        
    }
    
    func fetchImageURL(venueId: String, callback: @escaping (String?) -> Void) {
        let urlString = Constants.getImageCompleteURL(venueID: venueId, limit: 1)
        print(urlString)
        guard let url = URL(string: urlString) else {
            print("url unwrapping error")
            callback(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                print(err.localizedDescription)
                callback(nil)
                return
            }
            guard let d = data else {
                print("no data when getting image url")
                callback(nil)
                return
            }
            do {
                let res = try JSONDecoder().decode(ImageResult.self, from: d)
                let imageURL = res.response.photos.items[0].prefix + "300x500" + res.response.photos.items[0].suffix
                callback(imageURL)
            } catch {
                print(error.localizedDescription)
                callback(nil)
            }
        }.resume()
    }
    
    
    func fetchImage(venueId: String, callback: @escaping (Data?)->Void) {
        fetchImageURL(venueId: venueId) { response in
            guard let urlString = response else {
                callback(nil)
                return
            }
            print(urlString)
            guard let url = URL(string: urlString) else {
                callback(nil)
                return
            }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let err = error {
                    print(err.localizedDescription)
                    callback(nil)
                    return
                }
                callback(data)
            }.resume()
        }
    }
}
