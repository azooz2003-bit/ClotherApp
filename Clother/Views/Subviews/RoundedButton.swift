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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    RoundedButton(onPress: {}, icon: "")
}
