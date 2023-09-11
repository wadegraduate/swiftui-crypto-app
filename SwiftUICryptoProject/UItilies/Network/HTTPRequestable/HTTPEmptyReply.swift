//
//  HTTPEmptyReply.swift
//
//  Created by Wadealanchan on 20/8/2023.
//

import Foundation

/// Utility implementation for `HTTPReply` using if you request don't need to deserialize Reply
public struct HTTPEmptyReply: HTTPJsonReply {
    public init(json: Any) throws {
    }
}
