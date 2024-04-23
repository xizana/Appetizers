//
//  LoadingView.swift
//  Appetizers
//
//  Created by Lasha Khizanishvili on 23.04.24.
//

import SwiftUI


struct ActivityIndicator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor(Color(Colors.primaryColor))
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    
}

struct LoadingView: View {
    var body: some View {
        ActivityIndicator()
    }
}

#Preview {
    LoadingView()
}
