//
//  HTTPEmptyParam.swift
//  Created by Wadealanchan on 20/8/2023.
//

import Foundation

/// Utility implementation for `HTTPParam` using if you request don't need to serialize Param
public struct HTTPEmptyParam: HTTPJsonParam {
    public func encodeToJson() throws -> [String : Any] {
        return [:]
    }
}

public extension HTTPRequestable where Self.ParamT == HTTPEmptyParam {
    var param: ParamT {
        HTTPEmptyParam()
    }
}
