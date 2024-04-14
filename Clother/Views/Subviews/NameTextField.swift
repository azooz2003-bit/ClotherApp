//
//  NameTextField.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/7/24.
//

import SwiftUI

struct NameTextField: View {
    
    // TODO: this variable is missing something that will allow us to share it's value with the superview.
    @State var nameInput: String = ""
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 0.20), lineWidth:3)
            
            TextField("Enter Name...", text: $nameInput)
                .textContentType(.givenName)
                .fontDesign(.monospaced)
                .padding(.leading, 20)
            
        }.frame(width: 360, height: 40)
            .background(Color(red: 0.957, green: 0.965, blue: 0.988, opacity: 1.0))
    }
}

#Preview {
    NameTextField(nameInput: "")
}
