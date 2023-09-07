//
//  HTTPReply.swift
//
//  Created by Wadealanchan on 20/8/2023.
//

import Foundation

/// A type that can init itself with Any from HTTP response data
///
/// HTTP Reply Type conform this protocol to provide custom deserialize method
/// and `typealias ReplyT` in `HTTPRequestable` implementation
/// If the Reply is Json. Consider using `HTTPJsonReply` instead of
/// If the Reply is Empty. Consider using `HTTPEmptyReply` instead of
///
/// Example:
///
/// ``` swift
/// struct MyReply: HTTPReply {
///  let value1: String
///  let value2: Int
///  let value3: [String: String]
///
///  init(json: Any) throws {
///    // deserialize your model here with json: Any
///  }
/// }
/// ```
public protocol HTTPReply: Decodable {
    init(json: Any) throws
}

// MARK: - Array of HTTPReply support
extension Array: HTTPReply where Element: HTTPReply {
    public init(json: Any) throws {
        guard let jsonArray = json as? [[String: Any]] else {
            throw HTTPError(code: .invalidResponse)
        }
        
        self = try jsonArray.map { try Element(json: $0) }
    }
}

/// A type that can init itself with Any from HTTP response json data
///
/// Provide default implementation to deserialize object by using
/// `JSONSerialization.data(withJSONObject:)` and `JSONDecoder().decode(:from:)`
///
/// Example:
///
/// ``` swift
/// struct MyReply: HTTPJsonReply {
///   let value1: String
///   let value2: Int
///   let value3: [String: String]
/// }
/// ```
public protocol HTTPJsonReply: HTTPReply {}

extension HTTPJsonReply {
    public init(json: Any) throws {
        let jsonData = try JSONSerialization.data(withJSONObject: json)
        let decoder = JSONDecoder()
        self = try decoder.decode(Self.self, from: jsonData)
    }
}
