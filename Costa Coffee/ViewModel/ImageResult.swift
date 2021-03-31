//
//  ImageResult.swift
//  Costa Coffee
//
//  Created by Emil Vaklinov on 31/03/2021.
//

import Foundation

struct ImageResult: Codable {
    let response: ImageResponse
}

struct ImageResponse: Codable {
    let photos: PhotoList
}

struct PhotoList: Codable {
    let items: [Photo]
}

struct Photo: Codable {
    let id: String
    let createdAt: Int
    let prefix: String
    let suffix: String
    let width: Int
    let height: Int
}
