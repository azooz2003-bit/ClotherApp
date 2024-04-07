//
//  FormEntry.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI

struct FormDropdown<T>: View where T : Clothing.Property {
       
    var body: some View {
       Text("n/a")
    }
}

#Preview {
    FormDropdown<Clothing.Color>()
}
