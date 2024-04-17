//
//  NameTextField.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/7/24.
//

import SwiftUI

struct NameTextField: View {
    
    // TODO: this variable is missing something that will allow us to share it's value with the superview.
    @Binding var nameInput: String
    let customColor = ClotherStyle.CustomColor.self

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(customColor.skyBlue)
                .stroke(customColor.lightGray, lineWidth: 3)
            
            TextField("Enter Name...", text: $nameInput)
                .foregroundColor(.gray)
                .fontDesign(.monospaced)
                .padding(.leading, 16)
                .font(.system(size: 16))
            
        }.frame(width: 360, height: 50)
    }
}

struct NameTextFieldWrapper: View {
    @State private var name: String = ""  // Manage the text state here

    var body: some View {
        // Pass the @State variable as a binding to the NameTextField
        NameTextField(nameInput: $name)
            .padding()  // Optional padding for better layout in the preview
    }
}

// Preview provider that uses the wrapper
struct NameTextField_Previews: PreviewProvider {
    static var previews: some View {
        NameTextFieldWrapper()  // Use the wrapper view in the preview
    }
}
