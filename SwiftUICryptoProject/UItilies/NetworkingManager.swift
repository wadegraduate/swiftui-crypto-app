//
//  Utilities .swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 20/8/2023.
//

import Foundation
import Combine

class NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(let url):
                return "Bad response from URL: \(url)"
            case .unknown:
                return "Unknown error occured"
            }
        }
        
    }
    
    static func download(url: URL) -> AnyPublisher<Data, Error> {
        // Assuming you want to start the network request on a background queue and
        // deliver the results on the main queue, but this can be adjusted.
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap( {try handleURLResponse(output: $0, url: url)})
            .retry(3)
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              200..<300 ~= response.statusCode else {
            throw NetworkingError.badURLResponse(url: url)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
    
}
