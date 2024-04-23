//
//  ApetizerListCellView.swift
//  Appetizers
//
//  Created by Lasha Khizanishvili on 19.04.24.
//

import SwiftUI

struct ApetizerListCellView: View {

    let apetizer: Appetizer
    
    var body: some View {
        HStack {
            AppetizerRemoteImage(urlString: apetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(apetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                    .fontDesign(.monospaced)
                
                Text("$\(apetizer.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}



