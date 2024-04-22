//
//  ListViewModel.swift
//  AstroPix
//
//  Created by Sidhesh Gawas on 21/04/24.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var apodList = [ApodModel]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    let service: ApodServiceProtocol
    
    init(service: ApodServiceProtocol = ApodService()) {
        self.service = service
        fetchData()
    }
    
    func fetchData() {
        isLoading = true
        errorMessage = nil
        
        let url = Endpoint.createURL()

        service.fetchApodData(url: url) { [unowned self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .success(let apods):
                    self.apodList = apods
                }
            }
        }
    }
}
