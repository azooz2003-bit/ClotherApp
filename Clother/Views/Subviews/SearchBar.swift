//
//  SearchBar.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI

struct SearchBar: View {
    @State private var searchText = ""
    let onSearch: (String) -> Void
    
    init(onSearch: @escaping (String) -> Void) {
            self.onSearch = onSearch
        }
    
    // A closure to be executed whenever a new search text is entered. Argument should be search input.
    var body: some View {
            TextField("Search", text: $searchText, onCommit: {
                onSearch(searchText)
            })
        }
    }

    struct SearchBar_Previews: PreviewProvider {
        static var previews: some View {
            SearchBar(onSearch: { prompt in
                print("User searched: \(prompt)")
            })
        }
}
