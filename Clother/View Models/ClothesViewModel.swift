//
//  ClothesViewModel.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import Foundation

//TODO: make the necessary additions so that the view model properties can trigger view updates. HINT: think about what protocol and property wrapper to use.
class ClothesViewModel {
    
    // These represent the complete, unfiltered collection of closet items.
    var userOutfits: [OutfitItem]
    var userClothes: [ClothingItem]
    
    // These represent the outfits/clothes that the user is looking at per provided filters (if any) and provided search input (if any).
    var outfitsOnDisplay: [OutfitItem]
    var clothesOnDisplay: [ClothingItem]
    
    init() {
        self.userOutfits = []
        self.userClothes = []
        self.outfitsOnDisplay = []
        self.clothesOnDisplay = []
    }
    
    // TODO: Creates an outfit item and stores it in our application.
    func createOutfit(top: ClothingItem, bottom: ClothingItem, shoes: ClothingItem, other: [ClothingItem]) {
        
    }
    
    // TODO: Creates a clothing item and stores it in our application.
    func createClothing(name: String, image: Data, type: Clothing.Kind, size: Clothing.Size, color: Clothing.Color, weather: Clothing.Weather, fabric: Clothing.Fabric) {
        
    }
    
    /* TODO: Randomly creates an outfit out of the provided constraints and returns it. Do not store it anywhere.
        Instead of an OutfitItem, you will return a tuple of 3 values in the form of (top, bottom, shoes, accessories). If no top/bottom/shoes are available on the app, return nil.
        If a provided constraint is nil, it will not be enforced. HINT: you can utilize createOutfit(...) to avoid repeating code.
        NOTE: leave the name to be empty.
     */
    func generateRandomOutfit(type: Clothing.Kind?, size: Clothing.Size?, color: Clothing.Color?, weather: Clothing.Weather?, fabric: Clothing.Fabric?)
    -> (ClothingItem, ClothingItem, ClothingItem, [ClothingItem])? {
        // placeholder
        return (.sample, .sample, .sample, [.sample])
    }
    
    
    // TODO: Saves the outfit to the necessary collections.
    func saveOutfit(item: OutfitItem) {
        
    }
    
    // TODO: Manipulate the closet items on display such that only items with the provided input in their name are visible.
    func search(input: String) {
        
    }
    
    // TODO: Manipulate the clothing items on display such that only items with the provided filters are visible.
    /*
     If a given parameter is nil, it means that no filter was applied for it.
     */
    func filterClothes(by filter: Filter) {
        
    }
    
    // TODO: Manipulate the outfit items on display such that only items with the provided filters are visible.
    /*
     If a given parameter is nil, it means that no filter was applied for it.
     */
    func filterOutfits(topFilter: Filter, bottomFilter: Filter, shoesFilter: Filter) {
        
    }

}

struct Filter {
    var type: Clothing.Kind?
    var size: Clothing.Size? 
    var color: Clothing.Color?
    var weather: Clothing.Weather?
    var fabric: Clothing.Fabric?
}
