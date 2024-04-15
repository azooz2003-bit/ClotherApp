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
    @ObservedObject var homeVM: HomeViewModel
    @ObservedObject var clothesVM: ClothesViewModel
    
    var body: some View {
        VStack {
            Button(action: {
                homeVM.returnToHome()
            }) {
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 26, height: 21)
                    .foregroundColor(Color(red: 0.53, green: 0.55, blue: 0.62))
                
            }
            .padding()
            .offset(x: -140, y: -50)
            Text(homeVM.outfitOnDisplay?.name ?? "Name of Outfit")
                .font(.title2)
                .bold()
                .foregroundColor(Color(red: 0.529, green: 0.553, blue: 0.616))
                .fontDesign(.monospaced)
                .padding(.bottom, 30)
            
            HStack {
                VStack (spacing: 15){
                    ClosetItemView(closetItem: homeVM.outfitOnDisplay?.top ?? .sample, onPress: {
                        print($0)
                    })
                    ClosetItemView(closetItem: homeVM.outfitOnDisplay?.bottom ?? .sample, onPress: {
                        _ in homeVM.navigateTo(screen: .detailedClothing)
                    })
                    ClosetItemView(closetItem: homeVM.outfitOnDisplay?.shoes ?? .sample, onPress: {
                        _ in homeVM.navigateTo(screen: .detailedClothing)
                    })
                }
                VStack {
                    Text("Accessories")
                        .bold()
                        .foregroundColor(Color(red: 0.529, green: 0.553, blue: 0.616))
                        .fontDesign(.monospaced)
                        .font(.system(size: 16))
                        .padding(.bottom, 5)
                    VStack (spacing: 15){
                        ClosetItemView(closetItem: homeVM.outfitOnDisplay?.accessories[0] ?? .sample, onPress: {
                            _ in homeVM.navigateTo(screen: .detailedClothing)
                        })
                        .frame(width: 100, height: 100)
                        ClosetItemView(closetItem: homeVM.outfitOnDisplay?.accessories[1] ?? .sample, onPress: {
                            _ in homeVM.navigateTo(screen: .detailedClothing)
                        })
                        .frame(width: 100, height: 100)
                        ClosetItemView(closetItem: homeVM.outfitOnDisplay?.accessories[2] ?? .sample, onPress: {
                            _ in homeVM.navigateTo(screen: .detailedClothing)
                        })
                        .frame(width: 100, height: 100)
                    }

                }
                .padding(.horizontal)
            }
        }
    }
}
#Preview {
    OutfitDetailView(homeVM: .init(), clothesVM: .init())
}
