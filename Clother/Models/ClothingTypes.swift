//
//  ClothingTypes.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import Foundation
import SwiftUI

protocol ClosetItem: Identifiable, Hashable {
    var id: UUID {get}
    var name: String {get}
    var displayImage: Data? {get}
}

struct Clothing {
    
    enum Kind: String, Property {
        var id: String  {self.rawValue}

        case top, bottom, shoes, accessories
        
    }
    
    enum Size: String, Property {
        var id: String  {self.rawValue}

        case small, medium, large
        
    }
    
    enum Color: String, Property {
        var id: String  {self.rawValue}

        case red, blue, green, yellow, purple, orange, pink, black, navy, white
        
    }
    
    enum Weather: String, Property {
        var id: String  {self.rawValue}

        case warm, rainy, cold, freezing
        
    }
    
    enum Fabric: String, Property {
        var id: String  {self.rawValue}
        
        case cotton, linen, leather, silk, denim, wool, other
        
    }
    
    protocol Property: Identifiable, Hashable, CaseIterable {
        var id: String { get }
    }
    
    
}

