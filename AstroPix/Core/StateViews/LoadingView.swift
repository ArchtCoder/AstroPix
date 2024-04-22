//
//  LoadingView.swift
//  AstroPix
//
//  Created by Sidhesh Gawas on 22/04/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 20)  {
            Text("🛰")
                .font(.system(size: 80))
            Text("Fetching Astronomy Picture of Last 7 Days ...")
                .foregroundColor(.gray)
            
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
