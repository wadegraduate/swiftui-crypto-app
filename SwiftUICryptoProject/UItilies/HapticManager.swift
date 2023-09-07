//
//  HapticManager.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 28/8/2023.
//

import Foundation
import SwiftUI

class HapticManager {
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
    
}
