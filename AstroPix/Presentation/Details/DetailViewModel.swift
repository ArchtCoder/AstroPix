//
//  DetailViewModel.swift
//  AstroPix
//
//  Created by Sidhesh Gawas on 22/04/24.
//

import Foundation

class DetailViewModel: ObservableObject {
    @Published var imageUrl: String = ""
    @Published var description: String = ""
    
    public let apodModel: ApodModel
    
    init(apodModel: ApodModel) {
        self.apodModel = apodModel
    }
}
