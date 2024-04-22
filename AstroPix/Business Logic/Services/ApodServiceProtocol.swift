//
//  ApodServiceProtocol.swift
//  AstroPix
//
//  Created by Sidhesh Gawas on 22/04/24.
//

import Foundation

protocol ApodServiceProtocol: AnyObject {
    var networker: NetworkerProtocol { get }
    
    func fetchApodData(url: URL?, resultBlock: @escaping(Result<[ApodModel], APIError>) -> Void)
}
