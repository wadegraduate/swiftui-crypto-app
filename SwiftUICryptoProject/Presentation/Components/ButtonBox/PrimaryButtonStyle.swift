//
//  PrimaryButtonStyle.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 1/2/2024.
//

import SwiftUI


// Define a custom button style
struct PrimaryButtonStyle: ButtonStyle {
    var cornerRadius: CGFloat = 100.0

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.blue, lineWidth: 2)
            )
    }
}

// Usage example in a SwiftUI view
struct ButtonBoxContentView: View {
    var body: some View {
        Button("Press Me") {
            // Button action goes here
            print("Button pressed!")
        }
        .buttonStyle(PrimaryButtonStyle())
    }
}

#Preview {
    ButtonBoxContentView()
}

