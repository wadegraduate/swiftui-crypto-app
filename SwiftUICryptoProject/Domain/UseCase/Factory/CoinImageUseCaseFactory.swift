//
//  CoinImageUseCaseFactory.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 8/9/2023.
//

import Foundation

class CoinImageUseCaseFactory {
    static func makeCoinImageUseCase(coinModel: CoinModel) -> CoinImageUseCase {
        let networkservice: CoinImageNetworkServiceProtocol = CoinImageNetworkService(imageURL: coinModel.image)
        let repository: CoinImageRepositoryProtocol = CoinImageRepository(imageName: coinModel.id, networkService: networkservice)
        let useCase: CoinImageUseCase = CoinImageUseCase(repository: repository)
        return useCase
    }
}
