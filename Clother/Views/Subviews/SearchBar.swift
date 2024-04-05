//
//  SearchBar.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI

struct SearchBar: View {
    
    var onSearch: (String) -> Void
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SearchBar(onSearch: { prompt in
        print("User searched: \(prompt)")
    })
}
