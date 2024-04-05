//
//  ClothingItemView.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI

struct ClothingItemView: View {
    
    let clothingItem: ClothingItem
    // A custom closure or functionality to be executed upon clicking on this item view. Takes in the closet item being displayed.
    let onPress: (ClothingItem) -> Void
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {    
    ClothingItemView(clothingItem: ClothingItem.sample, onPress: {
        clothing in
        print(clothing)
    })
}
