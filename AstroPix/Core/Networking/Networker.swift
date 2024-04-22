//
//  Networker.swift
//  AstroPix
//
//  Created by Sidhesh Gawas on 22/04/24.
//

import Foundation

protocol NetworkerProtocol: AnyObject {
    func request<T: Decodable>(url: URL?, resultType: T.Type, completionHandler: @escaping(Result<T, APIError>) -> Void)
}

final class Networker: NetworkerProtocol {
    func request<T: Decodable>(url: URL?, resultType: T.Type, completionHandler: @escaping(Result<T, APIError>) -> Void) {
        guard let url = url else {
            completionHandler(Result.failure(APIError.badURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let error = error as? URLError {
                completionHandler(Result.failure(APIError.url(error)))
            } else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completionHandler(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: data)
                    completionHandler(Result.success(result))
                    
                } catch {
                    completionHandler(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }
        
        task.resume()
    }
}
