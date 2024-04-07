//
//  NameTextField.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/7/24.
//

import SwiftUI

struct NameTextField: View {
    @Binding var nameInput: String
    
    var body: some View {
        TextField("", text: $nameInput)
    }
}

#Preview {
    NameTextField(nameInput: .constant(""))
}
