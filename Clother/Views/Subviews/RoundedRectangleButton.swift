//
//  RoundedRectangleButton.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/7/24.
//

import SwiftUI

struct RoundedRectangleButton: View {
    // Action to execute upon pressing button
    let onPress: () -> Void
  //  var text: LocalizedStringKey
    let buttonText: String
    var body: some View {
        Button(action: onPress) {
                Text(buttonText)
                    .fontWeight(.medium)
                    .foregroundColor(Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 0.60))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
            }
            .background(Color(red: 0.957, green: 0.965, blue: 0.988, opacity: 1.0))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 0.20), lineWidth: 3)
            )
            .shadow(color: Color(red: 0.957, green: 0.965, blue: 0.988, opacity: 0.50), radius: 2
                    , x: 0, y: 0)
            .font(.headline)
            .fontDesign(.monospaced)
        }
        
}

#Preview {
    RoundedRectangleButton(onPress: {print("Button Pressed")}, buttonText: "Retake")
        .previewLayout(.sizeThatFits)
        .padding()
}
