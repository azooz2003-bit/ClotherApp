//
//  OutfitDetailView.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI

struct OutfitDetailView: View {
    // TODO: Do the following in this view:
    /*
     - Expect to receive the app's view models.
     - Build the UI. Create any necessary variables/functions.
     - Observe the UI components implemented under subviews folder. Do not reimplement a subview that has been built, use the subviews given to you as much as possible.
     - Don't forget to implement backwards navigation. Utilize the view model functions and variables for navigation.
     */
    @StateObject var homeVM: HomeViewModel
    @StateObject var clothesVM: ClothesViewModel
    
    var body: some View {
        VStack {
            Button(action: {
                homeVM.navigateBackwards()
            }) {
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 26, height: 21)
                    .foregroundColor(Color(red: 0.53, green: 0.55, blue: 0.62))
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .offset(x: 25)
            .padding(.vertical)
            
            Text(homeVM.outfitOnDisplay?.name ?? "Name of Outfit")
                .font(.title2)
                .bold()
                .foregroundColor(Color(red: 0.529, green: 0.553, blue: 0.616))
                .fontDesign(.monospaced)
                VStack (spacing: 10){
                    HStack (spacing: 10) {
                        ClosetItemView(closetItem: homeVM.outfitOnDisplay?.top ?? .sample, onPress: {
                            item in
                            homeVM.clothingOnDisplay = item
                            homeVM.navigateTo(screen: Phase2Screen.detailedClothing)
                        })
                        ClosetItemView(closetItem: homeVM.outfitOnDisplay?.jacket ?? .sample, onPress: {
                            item in
                            homeVM.clothingOnDisplay = item
                            homeVM.navigateTo(screen: Phase2Screen.detailedClothing)
                        })
                    }
                    HStack (spacing: 10) {
                        ClosetItemView(closetItem: homeVM.outfitOnDisplay?.bottom ?? .sample, onPress: {
                            item in
                            homeVM.clothingOnDisplay = item
                            homeVM.navigateTo(screen: Phase2Screen.detailedClothing)
                        })
                        ClosetItemView(closetItem: homeVM.outfitOnDisplay?.shoes ?? .sample, onPress: {
                            item in
                            homeVM.clothingOnDisplay = item
                            homeVM.navigateTo(screen: Phase2Screen.detailedClothing)
                        })
                    }
                }
                .padding(.bottom)
                VStack {
                    Text("Accessories")
                        .bold()
                        .foregroundColor(Color(red: 0.529, green: 0.553, blue: 0.616))
                        .fontDesign(.monospaced)
                        .font(.system(size: 16))
                        .padding(.bottom, 5)
                    HStack (spacing: 15){
                        ClosetItemView(closetItem: getAccessory(at: 0), onPress: {
                            item in
                            homeVM.clothingOnDisplay = item
                            homeVM.navigateTo(screen: Phase2Screen.detailedClothing)
                        })
                        .frame(width: 100, height: 100)
                        ClosetItemView(closetItem: getAccessory(at: 1), onPress: {
                            item in
                            homeVM.clothingOnDisplay = item
                            homeVM.navigateTo(screen: Phase2Screen.detailedClothing)
                        })
                        .frame(width: 100, height: 100)
                        ClosetItemView(closetItem: getAccessory(at: 2), onPress: {
                            item in
                            homeVM.clothingOnDisplay = item
                            homeVM.navigateTo(screen: Phase2Screen.detailedClothing)
                        })
                        .frame(width: 100, height: 100)
                    }

                }
                .padding(.horizontal)
            }
        .frame(maxHeight: .infinity , alignment: .top)
        .navigationDestination(for: Phase2Screen.self, destination: { _ in
            ClothingDetailView(homeVM: homeVM, clothesVM: clothesVM)
                .navigationBarBackButtonHidden()
        })
    }
    
    func getAccessory(at index: Int) -> ClothingItem {
        if let accessories = homeVM.outfitOnDisplay?.accessories, index < accessories.count {
            return accessories[index]
        } else {
            return .sample
        }
        
    }
}
#Preview {
    OutfitDetailView(homeVM: .init(), clothesVM: .init())
}
