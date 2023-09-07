//
//  HTTPURL.swift
//
//  Created by Wadealanchan on 20/8/2023.
//

import Foundation

/// A type of building urlString for HTTP request
///
/// Provide default implementation that make String/URL confirm to this protocol
/// So we can easy to use as
///
/// Example:
///
/// ``` swift
/// let url: HTTPURL = "google.com"
/// let url: HTTPURL = URL(string: "google.com")!
/// ```
public protocol HTTPURL {
    var urlString: String { get }
}

extension String: HTTPURL {
    public var urlString: String { return self }
}

extension URL: HTTPURL {
    public var urlString: String { return absoluteString }
}
