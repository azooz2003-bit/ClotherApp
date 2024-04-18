//
//  SearchBar.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI

struct CustomSearchBar: View {
    @Binding var searchText: String
    var onSearch: () -> Void
    var onSettings: () -> Void
    
    // A closure to be executed whenever a new search text is entered. Argument should be search input.
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 1.0))
            
            TextField("Search", text: $searchText)
                .foregroundColor(.gray)
                .fontDesign(.monospaced)
                .onChange(of: searchText) {
                    onSearch()
                }
            
            Button(action: onSettings) {
                Image(systemName: "slider.horizontal.3")
                    .foregroundColor(Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 1.0))
            }
        }
        .padding(8)
        .background(Color(red: 0.957, green: 0.965, blue: 0.988, opacity: 1.0))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
        .padding(.horizontal)
        
    }
}

struct CustomSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomSearchBar(
            searchText: .constant(""),
            onSearch: {  print("Search") },
            onSettings: { print("Settings") }
        )
    }

}
