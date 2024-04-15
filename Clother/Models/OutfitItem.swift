//
//  OutfitItem.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import Foundation

struct OutfitItem: ClosetItem {
    let id: UUID = UUID()
    let name: String
    let top: ClothingItem
    let bottom: ClothingItem
    let shoes: ClothingItem?
    let accessories: [ClothingItem]
    
    var displayImage: Data? {
        return top.displayImage ?? (bottom.displayImage ?? shoes?.displayImage)
    }
    
    static let sample = OutfitItem(name: "My favourite", top: .sample, bottom: .sample, shoes: .sample, accessories: [.sample])
    
}
