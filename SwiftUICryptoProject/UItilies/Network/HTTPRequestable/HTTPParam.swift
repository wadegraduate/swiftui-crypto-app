//
//  HTTPParam.swift
//
//  Created by Wadealanchan on 20/8/2023.
//

import Foundation

// MARK: - BASE

/// A type ask to serialize the model as Dictionary for putting into HTTP Request
///
/// HTTP Param Type conform this protocol to provide custom serialize method
/// and `typealias ParamT` in `HTTPRequestable` implementation
/// If expect encode Param as Json. Consider using `HTTPJsonParam` instead of
/// If  Param is empty. Consider using `HTTPEmptyParam` instead of
///
/// Example:
///
/// ``` swift
/// struct MyParam: HTTPParam {
///  let value1: String
///  let value2: Int
///  let value3: [String: String]
///
///  func encodeToJson() throws -> [String: Any]
///    // serialize your model here to [String: Any]
///  }
/// }
/// ```
public protocol HTTPParam: Encodable {
    func encodeToJson() throws -> [String: Any]
    func encodeToData() throws -> Data
    func convertToQueryItems() throws -> [URLQueryItem]
}

// MARK: - JSON

/// A type ask to serialize the model as Dictionary for putting into HTTP Request **AND**
///
/// provide default implementation to serialize object by using
/// `JSONEncoder().encode()` and `JSONSerialization.jsonObject(with:)`
///
/// Example:
///
/// ``` swift
/// struct MyParam: HTTPJsonParam {
///   let value1: String
///   let value2: Int
///   let value3: [String: String]
/// }
/// ```
public protocol HTTPJsonParam: HTTPParam {}

public extension HTTPJsonParam {
    func encodeToJson() throws -> [String : Any] {
        let paramData = try JSONEncoder().encode(self)
        let paramJson = try JSONSerialization.jsonObject(with: paramData)
        
        guard let paramJsonDict = paramJson as? [String: Any] else {
            assertionFailure()
            throw HTTPError(code: .invalidParam)
        }
        
        return paramJsonDict
    }
    
    func encodeToData() throws -> Data {
        let paramData = try JSONEncoder().encode(self)
        let paramJson = try JSONSerialization.jsonObject(with: paramData)
        
        guard let paramJsonDict = paramJson as? [String: Any] else {
            assertionFailure()
            throw HTTPError(code: .invalidParam)
        }
        return try JSONSerialization.data(withJSONObject: paramJsonDict, options: [])
    }
    
    func convertToQueryItems() throws -> [URLQueryItem] {
        return try self.encodeToJson().map { key, value in
            // Convert value to String here. You might need to handle specific types differently.
            let valueString = "\(value)"
            return URLQueryItem(name: key, value: valueString)
        }
    }
}
