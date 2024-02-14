//
//  HTTPRequestable.swift
//
//  Created by Wadealanchan on 20/8/2023.
//

import Foundation

/// Create JSONRequest with swift type-safe version
///
/// Params
/// - requestable:
///
/// Return:
///
/// *JsonRequest<RequestT>* subclass of *OKFJsonRequest* where you can call request as normal
/// ``` swift
/// struct SampleRequestable: HTTPOKexRequestable {
///     struct Reply: HTTPJsonReply {}
///     struct Param: HTTPJsonParam {}
///
///     typealias ReplyT = Reply
///     typealias ParamT = Param
///
///     let method: APIManagerRequestType = .get
///     let url: HTTPURL = "/api/"
///     let param: ParamT
/// }
///
/// let request = SampleRequestable(param: .init()).createJsonReques()
///
/// // set properties if needed
/// // request.shouldUseBody = true
///
/// request.start { result in
///    // result in type of Result<HTTPOKexRequestable.ReplyT, Error>
/// }
/// request.cancel() // when needed
/// ```
/// 
/// Same as OKFJsonRequest, you have to obtain request if not, it will release when out of it scope
public protocol HTTPRequestable {
    associatedtype ParamT: HTTPParam
    associatedtype ReplyT: HTTPReply
    
    var method: HTTPMethod { get }
    var url: HTTPURL { get }
    var param: ParamT { get }
    var customHeaders: [HTTPHeaderField: String] { get }
    var requestTimeOut: Float? { get }
}

public enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

// MARK: - Default implementation
extension HTTPRequestable {
    public var customHeaders: [HTTPHeaderField: String] { [:] }
}

// MARK: - JsonRequest builder
extension HTTPRequestable {
    public func toJsonRequest() -> JsonRequest<Self> {
        return JsonRequest(self)
    }
}
