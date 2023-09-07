//
//  HTTPHeaderField.swift
//
//  Created by Wadealanchan on 20/8/2023.
//

import Foundation

public struct HTTPHeaderField: Hashable, ExpressibleByStringLiteral {
    public typealias StringLiteralType = String
    public var rawValue: String
    
    public init(stringLiteral rawValue: String) {
        self.rawValue = rawValue
    }
}
