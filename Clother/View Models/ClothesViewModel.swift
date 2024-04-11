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
    func createOutfit(name: String, top: ClothingItem, bottom: ClothingItem, shoes: ClothingItem, other: [ClothingItem]) {
        let outfit = OutfitItem(name: name, top: top, bottom: bottom, shoes: shoes, other: other)
        userOutfits.append(outfit)
    }
    
    // TODO: Creates a clothing item and stores it in our application.
    func createClothing(name: String, image: Data, type: Clothing.Kind, size: Clothing.Size, color: Clothing.Color, weather: Clothing.Weather, fabric: Clothing.Fabric) {
        let clothing = ClothingItem(name: name, type: type, size: size, color: color, weather: weather, fabric: fabric, displayImage: image)
        userClothes.append(clothing)
    }
    
    /* TODO: Randomly creates an outfit out of the provided constraints and returns it. Do not store it anywhere.
     Instead of an OutfitItem, you will return a tuple of 3 values in the form of (top, bottom, shoes, accessories). If no top/bottom/shoes are available on the app, return nil.
     If a provided constraint is nil, it will not be enforced. HINT: you can utilize createOutfit(...) to avoid repeating code.
     NOTE: leave the name to be empty.
     */
    func generateRandomOutfit(size: Clothing.Size?, color: Clothing.Color?, weather: Clothing.Weather?, fabric: Clothing.Fabric?)
    -> (ClothingItem, ClothingItem, ClothingItem, [ClothingItem])? {
        var filteredTops: [ClothingItem] = []
        var filteredBottoms: [ClothingItem] = []
        var filteredShoes: [ClothingItem] = []
        var filteredAccessories: [ClothingItem] = []
        
        for item in userClothes {
            if let size = size, item.size != size {
                continue
            }
            if let color = color, item.color != color {
                continue
            }
            if let weather = weather, item.weather != weather {
                continue
            }
            if let fabric = fabric, item.fabric != fabric {
                continue
            }
            
            switch item.type {
            case .top:
                filteredTops.append(item)
            case .bottom:
                filteredBottoms.append(item)
            case .shoes:
                filteredShoes.append(item)
            case .accessories:
                filteredAccessories.append(item)
            default:
                continue
            }
        }
        guard !filteredTops.isEmpty, !filteredBottoms.isEmpty, !filteredShoes.isEmpty, !filteredAccessories.isEmpty else {
            return nil
        }
        let randomTop = filteredTops.randomElement()!
        let randomBottom = filteredBottoms.randomElement()!
        let randomShoe = filteredShoes.randomElement()!
        
        var randomAccessories: [ClothingItem] = []
        for _ in 0..<min(3, filteredAccessories.count) {
            let randomAccessory = filteredAccessories.randomElement()!
            randomAccessories.append(randomAccessory)
        }
        
        return (randomTop, randomBottom, randomShoe, randomAccessories)
    }
    
    
    // TODO: Saves the outfit to the necessary collections.
    func saveOutfit(item: OutfitItem) {
        userOutfits.append(item)
        outfitsOnDisplay = userOutfits
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
    func filterOutfits(topFilter: Filter, bottomFilter: Filter, shoesFilter: Filter) {
        outfitsOnDisplay = userOutfits.filter { outfitItem in
            let topMatch = topFilter.type == nil || outfitItem.top.type == topFilter.type
            let bottomMatch = bottomFilter.type == nil || outfitItem.bottom.type == bottomFilter.type
            let shoesMatch = shoesFilter.type == nil || outfitItem.shoes.type == shoesFilter.type
            
            return topMatch && bottomMatch && shoesMatch
        }
        
    }
    
    struct Filter {
        var type: Clothing.Kind?
        var size: Clothing.Size?
        var color: Clothing.Color?
        var weather: Clothing.Weather?
        var fabric: Clothing.Fabric?
    }
}
