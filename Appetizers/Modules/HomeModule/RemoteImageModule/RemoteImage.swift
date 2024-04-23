//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Lasha Khizanishvili on 23.04.24.
//

import SwiftUI


final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func load(fromUrlString urlString: String) {
        NetworkManager.shared.getImage(fromUrlString: urlString) { uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}


struct RemoteImage: View {
    let image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}


struct AppetizerRemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear { imageLoader.load(fromUrlString: urlString)}
    }
}
