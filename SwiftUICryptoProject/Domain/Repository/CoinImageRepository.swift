//
//  CoinImageRepository.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 8/9/2023.
//

import Foundation
import Combine

protocol CoinImageRepositoryProtocol {
    var imageDataPublisher: Published<ImageData?>.Publisher { get }
}

class CoinImageRepository: CoinImageRepositoryProtocol {
    
    @Published var imageData: ImageData? = nil
    internal var imageDataPublisher: Published<ImageData?>.Publisher { $imageData}
    
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName: String
    private let networkService: CoinImageNetworkServiceProtocol
    private var imageSubscription: AnyCancellable?
    
    init(imageName: String, networkService: CoinImageNetworkServiceProtocol) {
        self.imageName = imageName
        self.networkService = networkService
        fetchCoinImageData()
    }
    
    func fetchCoinImageData() {
        if let savedImageData = fileManager.getImageData(imageName: imageName, folderName: folderName) {
            imageData = savedImageData
            print("Retrieved image data from File Manager!")
        } else {
            downloadCoinImageData()
            print("downloading image data now")
        }
    }
    
    func downloadCoinImageData() {
        imageSubscription = networkService.downloadCoinImage()
            .sink { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let data):
                    self.imageData = data
                    self.fileManager.saveImageData(imageData: data, imageName: imageName, folderName: self.folderName)
                case .failure(let error):
                    print(error.localizedDescription)
                }
                self.imageSubscription?.cancel()
            }
    }
        
}

