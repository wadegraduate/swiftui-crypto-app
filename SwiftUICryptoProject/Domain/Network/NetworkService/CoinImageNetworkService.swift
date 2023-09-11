//
//  CoinImageNetworkService.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 8/9/2023.
//

import Foundation
import Combine

protocol CoinImageNetworkServiceProtocol {
    func downloadCoinImage() -> AnyPublisher<ImageData, HTTPError>
}

class CoinImageNetworkService: CoinImageNetworkServiceProtocol {
    
    let imageURL: HTTPURL
    
    init(imageURL: HTTPURL) {
        self.imageURL = imageURL
    }
    
    func downloadCoinImage() -> AnyPublisher<ImageData, HTTPError> {
        return ImageLoader.shared.downImage(url: imageURL.urlString)
    }
}
