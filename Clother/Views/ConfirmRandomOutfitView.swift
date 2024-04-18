//
//  ConfirmRandomOutfitView.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI

struct ConfirmRandomOutfitView: View {
    @StateObject var homeVM: HomeViewModel
    @StateObject var clothesVM: ClothesViewModel

    @State var nameInput: String = ""
    @State var topItem: ClothingItem
    @State var jacketItem: ClothingItem
    @State var bottomItem: ClothingItem
    @State var shoeItem: ClothingItem
    @State var accessoryItems: [ClothingItem]

    var body: some View {
        VStack {
            headerView
            itemSelectionView
            Spacer()
            NameTextField(nameInput: $nameInput) // Placeholder for a custom TextField implementation
            Spacer()
            RoundedButton(onPress: {
                clothesVM.createOutfit(name: nameInput, top: topItem, bottom: bottomItem, jacket: jacketItem, shoes: shoeItem, other: accessoryItems)
                homeVM.returnToHome()
            }, icon: "tray.and.arrow.down")
        }
    }

    private var headerView: some View {
        HStack {
            Button(action: {
                homeVM.navigateBackwards()
            }) {
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 26, height: 21)
                    .foregroundColor(Color(red: 0.53, green: 0.55, blue: 0.62))
                
            }
            .frame(alignment: .leading)
            .offset(x: 25)
            // Adds padding to the left of the button

            Spacer()

            Text("Selected Outfit")
                .font(.title2)
                .bold()
                .foregroundColor(Color(red: 0.529, green: 0.553, blue: 0.616))
                .fontDesign(.monospaced)

            Spacer()  // Ensures the title remains centered

        }
        .padding(.vertical, 10)
    }

    private var itemSelectionView: some View {
        VStack(spacing: 15) {
            HStack(spacing: 15) {
                ClosetItemView(closetItem: topItem, onPress: {print($0)
                })
                ClosetItemView(closetItem: jacketItem, onPress: {print($0)
                })
            }

            HStack(spacing: 15) {
                ClosetItemView(closetItem: bottomItem, onPress: {
                    print($0)
                })
                ClosetItemView(closetItem: shoeItem, onPress: {print($0)
                })
            }

            VStack(spacing: 15) {
                Text("Accessories")
                    .bold()
                    .foregroundColor(Color(red: 0.529, green: 0.553, blue: 0.616))
                    .fontDesign(.monospaced)
                    .font(.system(size: 16))
                    .padding(.bottom, 5)
                HStack(spacing: 10) {
                    ForEach(0..<accessoryItems.count, id: \.self) { index in
                        ClosetItemView(closetItem: accessoryItems[index], onPress: {print($0)
                        })
                        .frame(width: 100, height: 100)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct CreateOutfitView_Previews: PreviewProvider {
    let topItem1 = ClothingItem.sample
    let jacketItem1 = ClothingItem.sample
    let bottomItem1 = ClothingItem.sample
    let shoeItem1 = ClothingItem.sample
    let accessoryItems1 = [ClothingItem.sample, ClothingItem.sample, ClothingItem.sample]
    
    static var previews: some View {
        
        ConfirmRandomOutfitView(homeVM: .init(), clothesVM: .init(), topItem: .sample, jacketItem: .sample, bottomItem: .sample, shoeItem: .sample, accessoryItems: [.sample, .sample, .sample])
    }
}
