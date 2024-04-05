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
}

struct Clothing {
    
    enum Kind {
        case top, bottom, shoes, accessories
    }
    
    enum Size {
        case small, medium, large
    }
    
    enum Color {
        case red, blue, green, yellow, purple, orange, pink, black, navy, white
    }
    
    enum Weather {
        case warm, rainy, cold, freezing
    }
    
    enum Fabric {
        case cotton, linen, leather, silk, denim, wool, other
    }
}
