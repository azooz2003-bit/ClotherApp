//
//  FormEntry.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI

struct FormEntry<T>: View where T : Clothing.Property {
       
    var body: some View {
       Text("n/a")
    }
}

#Preview {
    FormEntry<Clothing.Color>()
}
