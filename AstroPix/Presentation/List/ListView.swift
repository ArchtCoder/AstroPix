//
//  ListView.swift
//  AstroPix
//
//  Created by Sidhesh Gawas on 21/04/24.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel = ListViewModel()
    
    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                LoadingView()
            } else if viewModel.errorMessage != nil  {
                ErrorView(errorMessage: viewModel.errorMessage ?? "", onTap: {
                    viewModel.fetchData()
                })
            } else {
                List {
                    ForEach(viewModel.apodList) { apodModel in
                        NavigationLink {
                            DetailView(viewModel: DetailViewModel(apodModel: apodModel))
                        } label: {
                            RowView(apodModel: apodModel)
                        }
                    }
                }
                .navigationTitle("Picture of the Day")
            }
        }
    }
}

struct RowView: View {
    let apodModel: ApodModel
    let imageSize: CGFloat = 100
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: apodModel.url)) { phase in
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
    
            VStack(alignment: .leading, spacing: 5) {
                Text(apodModel.title)
                    .font(.headline)
                Text(apodModel.date)
            }
        }
    }
}
