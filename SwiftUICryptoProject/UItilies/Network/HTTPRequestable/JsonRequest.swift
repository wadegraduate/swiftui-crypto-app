//
//  OKFRequest+Requestable.swift
//
//  Created by Wadealanchan on 20/8/2023.
//

import Foundation
import Combine

public class JsonRequest<RequestT: HTTPRequestable> {
    public let requestable: RequestT
    
    internal init(_ requestable: RequestT) {
        self.requestable = requestable
    }
    
    public func start() -> AnyPublisher<RequestT.ReplyT, HTTPError> {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = TimeInterval(requestable.requestTimeOut ?? 20.0)
        // We use the dataTaskPublisher from the URLSession which gives us a publisher to play around with.
        guard let url = URL(string: requestable.url.urlString), let urlRequest = createURLRequest(url: url) else {
            return AnyPublisher(
                Fail<RequestT.ReplyT, HTTPError>(error: HTTPError(code: .invaildURL))
            )
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw HTTPError(code: .invaildURL)
                }
                print(httpResponse.statusCode)
                return element.data
            }
            .decode(type: RequestT.ReplyT.self, decoder: JSONDecoder())
            .mapError { error in
                // return error if json decoding fails
                HTTPError(code: .invalidResponse)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func createURLRequest(url: URL) -> URLRequest? {
        var components = URLComponents(string: url.absoluteString)
        
        if requestable.method == .GET {
            do {
                components?.queryItems = try requestable.param.convertToQueryItems()
            } catch {
                print("Error")
            }
        }
        guard let url = components?.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = requestable.method.rawValue
        
        if !requestable.customHeaders.isEmpty {
            let customHeaders: [String: String] = .init(uniqueKeysWithValues: requestable.customHeaders.map {
                ($0.key.rawValue, $0.value)
            })
            request.allHTTPHeaderFields = customHeaders
        }
        
        if requestable.method == .POST {
            do {
                request.httpBody =  try requestable.param.encodeToData()
            } catch {
                print("Error")
            }
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        if let timeout = requestable.requestTimeOut {
            request.timeoutInterval = TimeInterval(timeout)
        }

        return request
    }
}
