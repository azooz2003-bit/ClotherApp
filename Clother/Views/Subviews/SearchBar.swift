//
//  SearchBar.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI

struct SearchBar: View {
    
    // A closure to be executed whenever a new search text is entered. Argument should be search input.
    let onSearch: (String) -> Void
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SearchBar(onSearch: { prompt in
        print("User searched: \(prompt)")
    })
}
