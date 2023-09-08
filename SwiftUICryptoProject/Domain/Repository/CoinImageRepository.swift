//
//  CoinImageRepository.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 8/9/2023.
//

import Foundation

typealias ImageData = Data

protocol CoinImageRepositoryProtocol {
    var imageDataPublisher: Published<ImageData>.Publisher { get }
    
}


//class CoinImageLocalRepository: CoinImageRepositoryProtocol {
//    var imageDataPublisher: Published<ImageData>.Publisher
//    
//    
//}
//
//class CoinImageRemoteRepository: CoinImageRepositoryProtocol {
//    var imageDataPublisher: Published<ImageData>.Publisher
//    
//    
//    getImage
//}
