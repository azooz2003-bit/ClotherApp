//
//  FormEntry.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI

struct FormDropdown<T>: View where T : Clothing.Property {
    
    // TODO: this variable is missing something that will allow us to share it's value with the superview.
    let promptTitle: String
    var options: [T] {
        T.allCases as! [T]
    }
    var selectedItem: T? = nil
       
    var body: some View {
       Text("n/a")
    }
}

#Preview {
    FormDropdown<Clothing.Color>(promptTitle: "color")
}
