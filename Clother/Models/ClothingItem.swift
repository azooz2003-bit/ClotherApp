//
//  ClothingItem.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import Foundation
import UIKit

struct ClothingItem: ClosetItem {
    let id: UUID = UUID()
    let name: String
    let type: Clothing.Kind?
    let size: Clothing.Size?
    let color: Clothing.Color?
    let weather: Clothing.Weather?
    let fabric: Clothing.Fabric?
    let displayImage: Data?
    
    static let sample = ClothingItem(name: "N/A", type: .bottom, size: .medium, color: .red, weather: .cold, fabric: .cotton, displayImage: nil)
    
    static let topSample = ClothingItem(name: "Top", type: .top, size: nil, color: nil, weather: nil, fabric: nil, displayImage: nil)
    static let bottomSample = ClothingItem(name: "Bottom", type: .bottom, size: nil, color: nil, weather: nil, fabric: nil, displayImage:  nil)
    static let jacketSample = ClothingItem(name: "Jacket", type: .jacket, size: nil, color: nil, weather: nil, fabric: nil, displayImage: nil)
    static let shoesSample = ClothingItem(name: "Shoes", type: .shoes, size: nil, color: nil, weather: nil, fabric: nil, displayImage: nil)
    static let accessoriesSample = [
        ClothingItem(name: "Acc 1", type: .accessories, size: nil, color: nil, weather: nil, fabric: nil, displayImage: nil),
        ClothingItem(name: "Acc 2", type: .accessories, size: nil, color: nil, weather: nil, fabric: nil, displayImage: nil),
        ClothingItem(name: "Acc 3", type: .accessories, size: nil, color: nil, weather: nil, fabric: nil, displayImage: nil)
    ]


    
}
