//
//  ApetizerListCellView.swift
//  Appetizers
//
//  Created by Lasha Khizanishvili on 19.04.24.
//

import SwiftUI

struct ApetizerListCellView: View {
    let title: String
    let price: Double
    
    var body: some View {
        HStack {
            Image("food-placeholder")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.medium)
                    .fontDesign(.monospaced)
                
                Text("$\(price, specifier: "%.2f")")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    ApetizerListCellView(title: "Sample Appetizer", price: 12)

}
