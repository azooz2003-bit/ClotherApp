//
//  RoundedButton.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/7/24.
//

import SwiftUI

struct RoundedButton: View {
    // Action to execute upon pressing button
    let onPress: () -> Void
    // Assets directory name of icon to be displayed in center of button.
    let icon: String
    
    var body: some View {
        Button(action: onPress) {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(.white)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 1.0), lineWidth: 1)
        )
        .shadow(radius: 5)
        
    }
}


#Preview {
    RoundedButton(onPress: {}, icon: "plus")
        .previewLayout(.sizeThatFits)
}
