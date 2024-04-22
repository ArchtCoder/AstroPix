//
//  ErrorView.swift
//  AstroPix
//
//  Created by Sidhesh Gawas on 22/04/24.
//

import SwiftUI

struct ErrorView: View {
    var errorMessage: String = ""
    let onTap: () -> Void
    
    init(errorMessage: String, onTap: @escaping () -> Void) {
        self.errorMessage = errorMessage
        self.onTap = onTap
    }
    
    var body: some View {
        VStack {
            Text(errorMessage)
                .multilineTextAlignment(.center)
            Button {
                onTap()
            } label: {
                Text("Try again")
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(errorMessage: "Error", onTap: {})
    }
}
