//
//  ListViewModel.swift
//  Costa Coffee
//
//  Created by Emil Vaklinov on 31/03/2021.
//

import Foundation

class ListViewModel: ObservableObject {
    let apiService = APIService()
    @Published var venueList = [Venue]()
    
    func fetchVenueList() {
        apiService.fetchData() { data in
            guard let list = data else {
                print("no data")
                return
            }
            DispatchQueue.main.async {
                self.venueList = list
            }
        }
    }
}
