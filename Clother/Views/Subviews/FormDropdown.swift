//
//  FormEntry.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI

struct FormDropdown<T>: View where T : Property {
    
    let promptTitle: String
    var options: [T] {
        T.allCases as! [T]
    }
    // TODO: this variable is missing something that will allow us to share it's value with the superview.
    var selectedItem: T?
       
    var body: some View {
       Text("n/a")
    }
}

#Preview {
    FormDropdown<Clothing.Color>(promptTitle: "color")
}
