//
//  OutfitFormView.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI

struct OutfitFormView: View {
    // TODO: Do the following in this view:
    /*
        - Expect to receive the app's view models.
        - Build the UI. Create any necessary variables/functions.
        - Observe the UI components implemented under subviews folder. Do not reimplement a subview that has been built, use the subviews given to you as much as possible.
        - Navigation should also work in this view. This screen can jump to a certain view as shown in Figma. Utilize the view model functions and variables for navigation. Don't forget to implement backwards navigation.  Submitting the form should take us back to the root (HomeView).
     */
    @StateObject var homeVM: HomeViewModel
    @StateObject var clothesVM: ClothesViewModel
    
    @State private var topItem: ClothingItem = ClothingItem(name: "Top", type: .top, size: nil, color: nil, weather: nil, fabric: nil, displayImage: UIImage(systemName: "plus.square")?.pngData())
    @State private var jacketItem: ClothingItem = ClothingItem(name: "Jacket", type: .jacket, size: nil, color: nil, weather: nil, fabric: nil, displayImage: UIImage(systemName: "plus.square")?.pngData())
    @State private var bottomItem: ClothingItem = ClothingItem(name: "Bottom", type: .bottom, size: nil, color: nil, weather: nil, fabric: nil, displayImage: UIImage(systemName: "plus.square")?.pngData())
    @State private var shoeItem: ClothingItem = ClothingItem(name: "Shoes", type: .shoes, size: nil, color: nil, weather: nil, fabric: nil, displayImage: UIImage(systemName: "plus.square")?.pngData())
    @State private var accessoryItems: [ClothingItem] = [
        ClothingItem(name: "Acc 1", type: .accessories, size: nil, color: nil, weather: nil, fabric: nil, displayImage: UIImage(systemName: "plus.square")?.pngData()),
        ClothingItem(name: "Acc 2", type: .accessories, size: nil, color: nil, weather: nil, fabric: nil, displayImage: UIImage(systemName: "plus.square")?.pngData()),
        ClothingItem(name: "Acc 3", type: .accessories, size: nil, color: nil, weather: nil, fabric: nil, displayImage: UIImage(systemName: "plus.square")?.pngData())
    ]
    
    @State var selectedAcc: Int?
    @State private var name: String = ""
    
    var body: some View {
        VStack {
            headerView
            itemSelectionView
            Spacer()
            NameTextField(nameInput: $name) // Placeholder for a custom TextField implementation
            Spacer()
            RoundedButton(onPress: {
                clothesVM.createOutfit(
                   name: name,
                   top: clothesVM.selectedItems[.top] ?? topItem,
                   bottom: clothesVM.selectedItems[.bottom] ?? bottomItem,
                   jacket: clothesVM.selectedItems[.jacket] ?? jacketItem,
                   shoes: clothesVM.selectedItems[.shoes] ?? shoeItem,
                   other: clothesVM.accessoryItems
                )
                homeVM.navigateBackwards()
            }, icon: "tray.and.arrow.down")
        }
        .navigationDestination(for: Phase2Screen.self, destination: { element in
            // Go to Selection screen
            SelectClothingView(homeVM: homeVM, clothesVM: clothesVM, selectedAcc: $selectedAcc)
                .navigationBarBackButtonHidden()
        })
    }

    private var headerView: some View {
        HStack {
            Button(action: {
                homeVM.navigateBackwards()
            }) {
                Image(systemName: "arrow.left")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 26, height: 21)
                    .foregroundColor(Color(red: 0.53, green: 0.55, blue: 0.62))
            }
            .padding(.leading)  // Adds padding to the left of the button

            Spacer()  // Pushes the button to the left and the title to the center

            Text("Select Outfit")
                .font(.title2)
                .bold()
                .foregroundColor(Color(red: 0.529, green: 0.553, blue: 0.616))
                .fontDesign(.monospaced)
            
            Spacer()  // Ensures the title remains centered
            
            // Invisible spacer to balance the HStack
            Image(systemName: "arrow.left")
                .resizable()
                .scaledToFit()
                .frame(width: 26, height: 21)
                .opacity(0)  // Makes this placeholder invisible
            .padding(.trailing)
        }
        .padding([.top, .horizontal])
        .padding(.bottom, 10)
    }
    
    private var itemSelectionView: some View {
        VStack(spacing: 15) {
            HStack(spacing: 15) {
                ClosetItemView(closetItem: clothesVM.selectedItems[.top] ?? topItem, onPress: {_ in
                    homeVM.selectedClothingKind = .top
                    homeVM.navigateTo(screen: Phase2Screen.selectClothing)
                })
                ClosetItemView(closetItem: clothesVM.selectedItems[.jacket] ?? jacketItem, onPress: {_ in
                    homeVM.selectedClothingKind = .jacket
                    homeVM.navigateTo(screen: Phase2Screen.selectClothing)
                })
            }
            
            HStack(spacing: 15) {
                ClosetItemView(closetItem: clothesVM.selectedItems[.bottom] ?? bottomItem, onPress: {_ in
                    homeVM.selectedClothingKind = .bottom
                    homeVM.navigateTo(screen: Phase2Screen.selectClothing)
                })
                ClosetItemView(closetItem: clothesVM.selectedItems[.shoes] ?? shoeItem, onPress: {_ in
                    homeVM.selectedClothingKind = .shoes
                    homeVM.navigateTo(screen: Phase2Screen.selectClothing)
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
                        ClosetItemView(closetItem: clothesVM.accessoryItems[index], onPress: {_ in
                            homeVM.selectedClothingKind = .accessories
                            selectedAcc = index
                            homeVM.navigateTo(screen: Phase2Screen.selectClothing)
                        })
                        .frame(width: 100, height: 100)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

// Preview for OutfitFormView
struct OutfitFormView_Previews: PreviewProvider {
    static var previews: some View {
        OutfitFormView(homeVM: .init(), clothesVM: .init())
    }
}

    
