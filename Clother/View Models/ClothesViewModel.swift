//
//  ClothesViewModel.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import Foundation

//TODO: make the necessary additions so that the view model properties can trigger view updates. HINT: think about what protocol and property wrapper to use.
class ClothesViewModel: ObservableObject {
    
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
    func createOutfit(name: String, top: ClothingItem, bottom: ClothingItem, jacket: ClothingItem, shoes: ClothingItem?, other: [ClothingItem]) {
        let outfit = OutfitItem(name: name, top: top, bottom: bottom, jacket: jacket, shoes: shoes, other: other)
        saveOutfit(item: outfit)
    }
    
    // TODO: Creates a clothing item and stores it in our application.
    func createClothing(name: String, image: Data, type: Clothing.Kind, size: Clothing.Size, color: Clothing.Color, weather: Clothing.Weather, fabric: Clothing.Fabric) {
        let clothing = ClothingItem(name: name, type: type, size: size, color: color, weather: weather, fabric: fabric, displayImage: image)
        saveClothing(item: clothing)
    }
    
    /* TODO: Randomly creates an outfit out of the provided constraints and returns it. Do not store it anywhere.
     Instead of an OutfitItem, you will return a tuple of 3 values in the form of (top, bottom, shoes, accessories). If no top/bottom/shoes are available on the app, return nil.
     If a provided constraint is nil, it will not be enforced. HINT: you can utilize createOutfit(...) to avoid repeating code.
     NOTE: leave the name to be empty.
     Returns:
        - In (top, bottom, shoes, accessories), top and bottom will always have a value unless an error is thrown indicating no tops or bottoms found. Shoes will be nil if no shoes are found. Accessories will be empty if none are found. Accessories size is no longer than 3.
     */
    func generateRandomOutfit(size: Clothing.Size?, color: Clothing.Color?, weather: Clothing.Weather?, fabric: Clothing.Fabric?)
    throws -> (ClothingItem, ClothingItem, ClothingItem?, ClothingItem?, [ClothingItem])  {
        
        // Filter clothes based on non-nil values
        let filteredTops = userClothes.filter { item in
            guard item.type == .top else { return false }
            return (size == nil || item.size == size) &&
            (weather == nil || item.weather == weather)
        }
        let filteredBottoms = userClothes.filter { item in
            guard item.type == .bottom else { return false }
            return (size == nil || item.size == size) &&
            (weather == nil || item.weather == weather)
        }
        let filteredJackets = userClothes.filter { $0.type == .jacket }
        let filteredShoes = userClothes.filter { $0.type == .shoes }
        let filteredAccessories = userClothes.filter { $0.type == .accessories }

        var randomTop: ClothingItem? = nil
        var randomBottom: ClothingItem? = nil
        var randomJacket: ClothingItem? = nil
        var randomShoe: ClothingItem? = nil
        var randomAccessories: [ClothingItem] = []
 
        if let color {
            let topsWithColor = filteredTops.filter({ $0.color == color })
            let bottomsWithColor = filteredBottoms.filter({ $0.color == color })

            // If top with color exists.
            if let top = topsWithColor.randomElement() {
                randomTop = top
            } // If bottom with color exists.
            else if let bottom = bottomsWithColor.randomElement() {
                randomBottom = bottom
            } // Item with this color doesn't exist.
            
        } else if let fabric {
            let topsWithFabric = filteredTops.filter({ $0.fabric == fabric })
            let bottomsWithFabric = filteredBottoms.filter({ $0.fabric == fabric })

            // If top with fabric exists and we haven't already assigned top.
            if let top = topsWithFabric.randomElement(), randomTop == nil {
                randomTop = top
            }  // If bottom with fabric exists and we haven't already assigned bottom.
            else if let bottom = bottomsWithFabric.randomElement(), randomBottom == nil {
                randomBottom = bottom
            } // Fabric doesn't exist.
           
        }
        
        // Try to make a match with weather and size.
        if let top = filteredTops.randomElement(), randomTop == nil {
            randomTop = top
        }
        if let bottom = filteredBottoms.randomElement(), randomBottom == nil {
            randomBottom = bottom
        }
        
        // If no match with weather and size for some clothings, choose arbitrary tops and bottoms.
        if randomTop == nil {
            randomTop = userClothes.filter { $0.type == .top }.randomElement()
        }
        if randomBottom == nil {
            randomBottom = userClothes.filter { $0.type == .bottom }.randomElement()
        }
        if let jacket = filteredJackets.randomElement() {
            randomJacket = jacket
        }
        // Choose shoes and accessories arbitrarily.
        if let shoe = filteredShoes.randomElement() {
            randomShoe = shoe
        }
        for _ in 0..<min(3, filteredAccessories.count) {
            if let randomAccessory = filteredAccessories.randomElement() {
                randomAccessories.append(randomAccessory)
            }
        }
        
        if let randomTop, let randomBottom {
            return (randomTop, randomBottom, randomJacket, randomShoe, randomAccessories)
        } else {
        
            throw RandomOutfitError.generateError(randomTop, randomBottom)
        }
    }
        
    // TODO: Saves the outfit to the necessary collections.
    func saveOutfit(item: OutfitItem) {
        userOutfits.append(item)
        outfitsOnDisplay = userOutfits
    }
    // TODO: Saves the outfit to the necessary collections.
    func saveClothing(item: ClothingItem) {
        userClothes.append(item)
        clothesOnDisplay = userClothes
    }
    // TODO: Manipulate the closet items on display such that only items with the provided input in their name are visible.
    func search(input: String) {
        clothesOnDisplay = userClothes.filter {$0.name.lowercased().contains(input.lowercased())}
    }
    
    // TODO: Manipulate the clothing items on display such that only items with the provided filters are visible.
    /*
     If a given parameter is nil, it means that no filter was applied for it.
     */
    func filterClothes(by filter: Filter) {
        clothesOnDisplay = userClothes.filter { clothingItem in
            let typeMatch = filter.type == nil || clothingItem.type == filter.type
            let sizeMatch = filter.size == nil || clothingItem.size == filter.size
            let colorMatch = filter.color == nil || clothingItem.color == filter.color
            let weatherMatch = filter.weather == nil || clothingItem.weather == filter.weather
            let fabricMatch = filter.fabric == nil || clothingItem.fabric == filter.fabric
            
            return typeMatch && sizeMatch && colorMatch && weatherMatch && fabricMatch
        }
    }
    
    // TODO: Manipulate the outfit items on display such that only items with the provided filters are visible.
    /*
     If a given parameter is nil, it means that no filter was applied for it.
     */
    func filterOutfits(topFilter: Filter, bottomFilter: Filter) {
        outfitsOnDisplay = userOutfits.filter { outfit in
            let topMatch = (topFilter.type == nil || outfit.bottom.type == topFilter.type) &&
            (topFilter.size == nil || outfit.bottom.size == topFilter.size) &&
            (topFilter.color == nil || outfit.bottom.color == topFilter.color) &&
            (topFilter.weather == nil || outfit.bottom.weather == topFilter.weather) &&
            (topFilter.fabric == nil || outfit.bottom.fabric == topFilter.fabric)
            
            let bottomMatch = (bottomFilter.type == nil || outfit.bottom.type == bottomFilter.type) &&
            (bottomFilter.size == nil || outfit.bottom.size == bottomFilter.size) &&
            (bottomFilter.color == nil || outfit.bottom.color == bottomFilter.color) &&
            (bottomFilter.weather == nil || outfit.bottom.weather == bottomFilter.weather) &&
            (bottomFilter.fabric == nil || outfit.bottom.fabric == bottomFilter.fabric)

            return topMatch && bottomMatch
        }
    }
    
}

struct Filter {
    var type: Clothing.Kind?
    var size: Clothing.Size?
    var color: Clothing.Color?
    var weather: Clothing.Weather?
    var fabric: Clothing.Fabric?
}

