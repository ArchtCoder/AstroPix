//
//  ApodService.swift
//  AstroPix
//
//  Created by Sidhesh Gawas on 22/04/24.
//

import Foundation

final class ApodService: ApodServiceProtocol {
    
    let networker: NetworkerProtocol
    
    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }
    
    func fetchApodData(url: URL?, resultBlock: @escaping (Result<[ApodModel], APIError>) -> Void) {
        networker.request(url: url,
                          resultType: [ApodModel].self,
                          completionHandler: resultBlock)
    }
}
