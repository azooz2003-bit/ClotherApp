//
//  Errors.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/13/24.
//

import Foundation

enum RandomOutfitError: Error {
    case missingTop, missingBottom, missingTopAndBottom, other
    
    static func generateError(_ randomTop: ClothingItem?, _ randomBottom: ClothingItem?) -> RandomOutfitError {
        if randomTop == nil && randomBottom == nil {
            return .missingTopAndBottom
        } else if randomTop == nil {
            return .missingTop
        } else if randomBottom == nil {
            return .missingBottom
        } else {
            return other
        }
    }
    
    var header: String {
        "Random Outfit Failed"
    }
    
    var description: String {
        switch self {
        case .missingTop:
            "You do not have any tops in your closet."
        case .missingBottom:
            "You do not have any bottoms in your closet."
        case .missingTopAndBottom:
            "You do not have any tops or bottoms in your closet."
        case .other:
            "Please check your closet."
        }
    }
}
