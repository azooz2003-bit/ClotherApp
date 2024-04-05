//
//  ClothesViewModel.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import Foundation

class ClothesViewModel {
    
    // TODO: Creates an outfit item and stores it in our application.
    func createOutfit(top: ClothingItem, bottom: ClothingItem, shoes: ClothingItem, other: [ClothingItem]) {
        
    }
    
    // TODO: Creates a clothing item and stores it in our application.
    func createClothing(name: String, image: Data, type: Clothing.Kind, size: Clothing.Size, color: Clothing.Color, weather: Clothing.Weather, fabric: Clothing.Fabric) {
        
    }
    
    /* TODO: Randomly creates an outfit out of the provided constraints and returns it. Do not store it anywhere.
        Instead of an OutfitItem, you will return a tuple of 3 values in the form of (top, bottom, shoes). If no top/bottom/shoes are available on the app, return nil.
        If a provided constraint is nil, it will not be enforced. HINT: you can utilize createOutfit(...) to avoid repeating code.
        NOTE: leave the name to be empty.
     */
    func generateRandomOutfit(type: Clothing.Kind?, size: Clothing.Size?, color: Clothing.Color?, weather: Clothing.Weather?, fabric: Clothing.Fabric?)
    -> (ClothingItem, ClothingItem, ClothingItem)? {
        
        // placeholder
        return (.sample, .sample, .sample)
    }
    
    
    // Saves the outfit to the necessary collections.
    func saveOutfit(item: OutfitItem) {
        
    }
    
    // Manipulate the closet items on display such that only items with the provided input in their name are visible.
    func search(input: String) {
        
    }
    
    // Manipulate the closet items on display such that only items with the provided filters are visible.
    func filterBy() {
        
    }

}
