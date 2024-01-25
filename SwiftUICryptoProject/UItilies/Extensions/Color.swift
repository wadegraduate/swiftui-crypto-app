//
//  Color.swift
//  SwiftfulCrypto
//
//  Created by Nick Sarno on 5/8/21.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
    static let launch = LaunchTheme()
}

struct ColorTheme {
    
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
    
    
    let primaryGreen = Color(red: 0.33, green: 1, blue: 0.4)
    let neutralSolidWhite = Color("TextColorWhite")
    let neutralSolidBlack = Color(.black)
    let neutralSolid400: Color = Color(red: 0.7, green: 0.7, blue: 0.7)
    
}

struct LaunchTheme {
    let accent = Color("LaunchAccentColor")
    let background = Color("LaunchBackgroundColor")
    
}
