//
//  ContentView.swift
//  Costa Coffee
//
//  Created by Emil Vaklinov on 31/03/2021.
//

import SwiftUI

struct ListItemView: View {
    
    let venue: Venue
    let apiService = APIService()
    @State var image = UIImage()
    var body: some View {
        
        VStack {
            ZStack {
                HStack(spacing: 50) {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .border(Color.red, width: 3.0)
                        .frame(width: 100, height: 100, alignment: .center)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color.white, lineWidth: 2)
                        )
                    ZStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("\(venue.name)")
                                .font(Font.system(size: 18))
                            Text("\(venue.location.address)")
                                .font(Font.system(size: 12))
                                .foregroundColor(.gray)
                            Text("\(venue.location.city)")
                                .font(Font.system(size: 14))
                                .foregroundColor(.gray)
                            Text("\(String(format: "%.1f", Float(venue.location.distance) * 0.000621)) miles")
                                .font(Font.system(size: 14))
                                .foregroundColor(.gray)
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.global().async {
                        fetchImage()
                    }
                }
            }
        }
    }
    func fetchImage() {
        apiService.fetchImage(venueId: venue.id) { data in
            guard let d = data else {
                print("no image data")
                return
            }
            guard let img = UIImage(data: d) else {
                print("cannot create uiimage")
                return
            }
            DispatchQueue.main.async {
                self.image = img
            }
        }
    }
}
