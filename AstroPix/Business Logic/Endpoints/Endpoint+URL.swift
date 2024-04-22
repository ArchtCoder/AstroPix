//
//  Endpoint+URL.swift
//  AstroPix
//
//  Created by Sidhesh Gawas on 22/04/24.
//

import Foundation

struct Endpoint {
    static func createFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
    
    static func createURL() -> URL {
        let formatter = Endpoint.createFormatter()
        let startDateString = formatter.string(from: createDate(daysFromToday: 7))
        let endDateString = formatter.string(from: createDate(daysFromToday: 1))
        
        let url = URL(string: Constants.baseURL)!
        let urlQuery = url.withQuery(["api_key": Constants.apikey,
                                     "start_date": startDateString,
                                     "end_date": endDateString])!
        return urlQuery
    }
    
    static func createDate(daysFromToday: Int) -> Date {
        let today = Date()
        if let newDate = Calendar.current.date(byAdding: .day, value: -daysFromToday, to: today) {
            return newDate
        } else {
            return today
        }
    }
}

extension URL {
    func withQuery(_ query: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = query.map { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}
