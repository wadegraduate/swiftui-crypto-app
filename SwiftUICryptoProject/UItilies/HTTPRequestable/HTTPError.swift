//
//  HTTPError.swift
//
//  Created by Wadealanchan on 20/8/2023.
//

import Foundation

public struct HTTPError: Error {
    public let code: Code
}

extension HTTPError {
    public enum Code {
        case weakError
        case invaildURL
        case invalidParam
        case unsupported
        case noResponse
        case invalidResponse
    }
}
