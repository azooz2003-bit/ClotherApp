//
//  ClothingItem.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import Foundation

struct ClothingItem: ClosetItem {
    let id: UUID = UUID()
    let name: String
    let type: Clothing.Kind?
    let size: Clothing.Size?
    let color: Clothing.Color?
    let weather: Clothing.Weather?
    let fabric: Clothing.Fabric?
    let displayImage: Data?
    
    static let sample = ClothingItem(name: "Abercrombie", type: .bottom, size: .medium, color: .red, weather: .cold, fabric: .cotton, displayImage: nil)
    
}
