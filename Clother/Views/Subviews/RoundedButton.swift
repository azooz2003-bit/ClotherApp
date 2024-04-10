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
                .frame(width: 80, height: 80)
                .font(.title)
                .foregroundColor(Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 0.6))
                .background(Color(red: 0.957, green: 0.965, blue: 0.988, opacity: 1.0))
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 0.2), lineWidth: 2)
                )

        }
        
        
    }
}


#Preview {
    RoundedButton(onPress: {}, icon: "plus")
        .previewLayout(.sizeThatFits)
}
