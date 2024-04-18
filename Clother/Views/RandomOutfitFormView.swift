//
//  RandomOutfitFormView.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI

struct RandomOutfitFormView: View {
    @StateObject var homeVM: HomeViewModel
    @StateObject var clothesVM: ClothesViewModel

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
            Button(action: {
                homeVM.returnToHome()
            }) {
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 26, height: 21)
                    .foregroundColor(Color(red: 0.53, green: 0.55, blue: 0.62))
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 25)
            .padding(.vertical)
            
            Spacer()

            FormDropdown(promptTitle: "Size", selectedItem: $selectedSize)
            FormDropdown(promptTitle: "Color", selectedItem: $selectedColor)
            FormDropdown(promptTitle: "Weather", selectedItem: $selectedWeather)
            FormDropdown(promptTitle: "Fabric", selectedItem: $selectedFabric)

            RoundedRectangleButton(onPress: randomizeSelection, buttonText: "Randomize")

            Spacer()
        }
        .navigationDestination(for: Phase2Screen.self, destination: { _ in
            ConfirmRandomOutfitView(homeVM: homeVM, clothesVM: clothesVM, topItem: topItem ?? .sample, jacketItem: jacketItem ?? .sample, bottomItem: bottomItem ?? .sample, shoeItem: shoeItem ?? .sample, accessoryItems: accessoryItems)
                .navigationBarBackButtonHidden()
        })
    }

    private func randomizeSelection() {
        do {

            let randomOutfit = try clothesVM.generateRandomOutfit(size: selectedSize, color: selectedColor, weather: selectedWeather, fabric: selectedFabric)
            topItem = randomOutfit.0
            bottomItem = randomOutfit.1
            jacketItem = randomOutfit.2
            shoeItem = randomOutfit.3
            accessoryItems = randomOutfit.4
            
            homeVM.navigateTo(screen: Phase2Screen.confirmRandomizedOutfit)
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
