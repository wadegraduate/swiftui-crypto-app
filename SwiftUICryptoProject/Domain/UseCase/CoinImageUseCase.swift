//
//  CoinImageUseCase.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 8/9/2023.
//

import Foundation
import Combine

protocol CoinImageUseCaseProtocol {
    var imageDataPublisher: Published<ImageData?>.Publisher { get }
}

class CoinImageUseCase : CoinImageUseCaseProtocol {
    @Published var imageData: ImageData? = nil
    internal var imageDataPublisher: Published<ImageData?>.Publisher { $imageData }
    
    private var cancellables: Set<AnyCancellable> = []
    private let repository: CoinImageRepositoryProtocol
    
    init(repository: CoinImageRepositoryProtocol) {
        self.repository = repository
        getImageData()
    }
    
    func getImageData() {
        repository.imageDataPublisher
            .sink { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let data):
                    self.imageData = data
                case .failure(_):
                    break
                }
            }
            .store(in: &cancellables)
    }
}
