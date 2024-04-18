//
//  RandomOutfitFormView.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI
import Foundation

/*struct RandomOutfitFormView: View {
    // TODO: Do the following in this view:
    /*
        - Expect to receive the app's view models.
        - Build the UI. Create any necessary variables/functions.
        - Observe the UI components implemented under subviews folder. Do not reimplement a subview that has been built, use the subviews given to you as much as possible.
        - Navigation should also work in this view. This screen can jump to a certain view as shown in Figma. Utilize the view model functions and variables for navigation. Don't forget to implement backwards navigation.
     */
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    RandomOutfitFormView()
}
*/
struct RandomOutfitFormView: View {
    @ObservedObject var homeVM: HomeViewModel
    @ObservedObject var clothesVM: ClothesViewModel
    
    @State private var selectedSize: Clothing.Size?
    @State private var selectedColor: Clothing.Color?
    @State private var selectedWeather: Clothing.Weather?
    @State private var selectedFabric: Clothing.Fabric?
    
    @State var topItem: ClothingItem?
    @State var jacketItem: ClothingItem?
    @State var bottomItem: ClothingItem?
    @State var shoeItem: ClothingItem?
    @State var accessoryItems: [ClothingItem] = []
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            FormDropdown(promptTitle: "Size", selectedItem: $selectedSize)
            FormDropdown(promptTitle: "Color", selectedItem: $selectedColor)
            FormDropdown(promptTitle: "Weather", selectedItem: $selectedWeather)
            FormDropdown(promptTitle: "Fabric", selectedItem: $selectedFabric)
            
            RoundedRectangleButton(onPress: randomizeSelection, buttonText: "Randomize")
            
            Spacer()
        }
        .padding()
    }
    
    private func randomizeSelection() {
        do {
            selectedSize = Clothing.Size.allCases.randomElement()
            selectedColor = Clothing.Color.allCases.randomElement()
            selectedWeather = Clothing.Weather.allCases.randomElement()
            selectedFabric = Clothing.Fabric.allCases.randomElement()
            
            let randomOutfit = try clothesVM.generateRandomOutfit(size: selectedSize, color: selectedColor, weather: selectedWeather, fabric: selectedFabric)
            topItem = randomOutfit.0
            bottomItem = randomOutfit.1
            jacketItem = randomOutfit.2
            shoeItem = randomOutfit.3
            accessoryItems = randomOutfit.4
        } catch {
            // Handle the error here
            print("Error generating random outfit: \(error)")
        }
    }
}

struct RandomOutfitFormView_Previews: PreviewProvider {
    static var previews: some View {
        RandomOutfitFormView(homeVM: HomeViewModel(), clothesVM: ClothesViewModel())
    }
}
