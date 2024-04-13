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
    
    // This is the global struct which contains information for standardized stylings.
    let cell = ClotherStyle.GridCell.self
    let grid = ClotherStyle.Grid.self
    
    var body: some View {
            ScrollView {
                LazyVGrid(columns: [ // Defining two columns without special attributes.
                    .init(.adaptive(minimum: cell.minWidth, maximum: cell.maxWidth), spacing: cell.horizontalSpacing), // Makes sure grid item takes up only space of closet item.
                    .init(.adaptive(minimum: cell.minWidth, maximum: cell.maxWidth))
                ], spacing: 20) {
                    ForEach(closetItems.indices, id: \.self) { idx in
                        ClosetItemView(closetItem: closetItems[idx], onPress: onItemPress)
                    }
                }
                .padding(grid.sideSpacing)
                
            }
        }
    }

#Preview {
    ClosetGrid<ClothingItem>(onItemPress: {
        _ in
        
    }, closetItems: [.sample, .sample, .sample, .sample, .sample,.sample, .sample, .sample, .sample, .sample])
    
}
