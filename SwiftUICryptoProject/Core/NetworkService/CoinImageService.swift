//
//  CoinImageService.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 20/8/2023.
//

import Foundation
import SwiftUI
import Combine

enum CoinImageServiceError: Error {
    case invalidImageData
}

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName: String
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
            print("Retrieved image from File Manager!")
        } else {
            downloadCoinImage()
            print("downloading image now")
        }
    }
    
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image) else {  return }
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage in
                guard let image = UIImage(data: data) else {
                    throw CoinImageServiceError.invalidImageData
                }
                return image
            })
            .receive(on: DispatchQueue.main)
            .sink (receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedImage in
                guard let self = self else { return }
                self.image = returnedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: returnedImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
}
