//
//  OutfitItemView.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI

struct ClosetItemView<T>: View where T : ClosetItem {
    
    // The outfit whose information we want to display.
    let closetItem: T
    // A custom closure or functionality to be executed upon clicking on this item view. Takes in the closet item being displayed.
    let onPress: (T) -> Void
    
    var body: some View {
        Text("")
    }
}

#Preview {
    ClosetItemView(closetItem: OutfitItem.sample, onPress: {
        print($0)
    })
}
