//
//  ApodModel.swift
//  AstroPix
//
//  Created by Sidhesh Gawas on 22/04/24.
//

import Foundation

struct ApodModel: Codable, Identifiable {
    let id = UUID()
    let date: String
    let explanation: String
    let mediaType: String
    let serviceVersion: String
    let title: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case date
        case explanation
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title
        case url
    }
}



/// Helper function that returns a UIImage from a URL. If the URL is invalid a default image is returned.
/// - Parameter url: URL of an image
//fileprivate func downloadImage(url: String) -> UIImage {
//    if let imageUrl = URL(string: url), let imageData = try? Data(contentsOf: imageUrl) {
//        return UIImage(data: imageData)!
//    }
//    
//    return UIImage(named: "OwlSmall")!  // Return a default image
//}
//
