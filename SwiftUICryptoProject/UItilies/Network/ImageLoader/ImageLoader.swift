//
//  ImageLoader.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 8/9/2023.
//

import Foundation
import Combine

typealias ImageData = Data

class ImageLoader {
    
    static let shared = ImageLoader()
    
    func downImage(url: String) -> AnyPublisher<ImageData, HTTPError> {
        guard let url = URL(string: url) else {
            // Return a fail publisher if the url is invalid
            return AnyPublisher(
                Fail<ImageData, HTTPError>(error: HTTPError(code: .invaildURL))
            )
        }
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw HTTPError(code: .invaildURL)
                }
                return element.data
            }
            .mapError { error in
                // return error if json decoding fails
                HTTPError(code: .invalidResponse)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
