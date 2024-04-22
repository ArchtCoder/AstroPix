//
//  DetailView.swift
//  AstroPix
//
//  Created by Sidhesh Gawas on 21/04/24.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: DetailViewModel
    let imageSize: CGFloat = 300
    
    var body: some View {
        ScrollView {
            VStack {
                CacheAsyncImage(url: URL(string: viewModel.imageUrl)!) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: imageSize, height: imageSize)
                    case .success(let image):
                        image.resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .clipped()
                    case .failure:
                        Image(systemName: "photo")
                            .frame(width: imageSize, height: imageSize)
                    @unknown default:
                        EmptyView()
                    }
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    Text(viewModel.description)
                    
                    Spacer()
                }.padding()
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
