//
//  ClothesGridView.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI

struct ClosetGrid<T>: View where T : ClosetItem  {
    
    // A custom closure or functionality to be executed upon clicking on a grid item. Takes in the selected closet item.
    let onItemPress: (T) -> Void
    // The closet items to be displayed in this grid.
    let closetItems: [T]
    
    var body: some View {
        Text("")
    }
}

#Preview {
    ClosetGrid<ClothingItem>(onItemPress: {
        _ in
        
    }, closetItems: [.sample, .sample])
}
