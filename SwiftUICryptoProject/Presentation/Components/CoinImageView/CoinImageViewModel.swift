//
//  CoinImageViewModel.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 8/9/2023.
//

import Foundation
import Combine

class CoinImageViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var imageData: ImageData? = nil
    
    private let coin: CoinModel
    private var cancellables = Set<AnyCancellable>()
    private let coinImageUseCase: CoinImageUseCaseProtocol
    
    init(coin: CoinModel) {
        self.coin = coin
        self.coinImageUseCase = CoinImageUseCaseFactory.makeCoinImageUseCase(coinModel: coin)
        addSubscribers()
        isLoading = true
    }
    
    private func addSubscribers() {
        coinImageUseCase.imageDataPublisher
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] data in
                self?.imageData = data
            }
            .store(in: &cancellables)
    }
}
