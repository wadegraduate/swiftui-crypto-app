//
//  Publisher+Additionals.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 6/9/2023.
//

import Foundation
import Combine

extension Publisher {
    /// Transform to Result Type
        func sink(result: @escaping ((Result<Self.Output, Self.Failure>) -> Void)) -> AnyCancellable {
            return sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    result(.failure(error))
                }
            } receiveValue: { output in
                result(.success(output))
            }
        }
}
