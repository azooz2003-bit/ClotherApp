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
    @ObservedObject var homeVM: HomeViewModel
    @ObservedObject var clothesVM: ClothesViewModel
    
    @State private var topItem: ClothingItem
    @State private var jacketItem: ClothingItem
    @State private var bottomItem: ClothingItem
    @State private var shoeItem: ClothingItem
    @State private var accessoryItems: [ClothingItem]
    @State var selectedAcc: Int?


    @State private var name: String = ""
    
    init(homeVM: HomeViewModel, clothesVM: ClothesViewModel) {
        self._homeVM = ObservedObject(initialValue: homeVM)
        self._clothesVM = ObservedObject(initialValue: clothesVM)
        // Initialize the default states
        _topItem = State(initialValue: ClothingItem(name: "Top", type: .top, size: nil, color: nil, weather: nil, fabric: nil, displayImage: UIImage(systemName: "plus.square")?.pngData()))
        _jacketItem = State(initialValue: ClothingItem(name: "Jacket", type: .jacket, size: nil, color: nil, weather: nil, fabric: nil, displayImage: UIImage(systemName: "plus.square")?.pngData()))
        _bottomItem = State(initialValue: ClothingItem(name: "Bottom", type: .bottom, size: nil, color: nil, weather: nil, fabric: nil, displayImage: UIImage(systemName: "plus.square")?.pngData()))
        _shoeItem = State(initialValue: ClothingItem(name: "Shoes", type: .shoes, size: nil, color: nil, weather: nil, fabric: nil, displayImage: UIImage(systemName: "plus.square")?.pngData()))
        _accessoryItems = State(initialValue: [
            ClothingItem(name: "Acc 1", type: .accessories, size: nil, color: nil, weather: nil, fabric: nil, displayImage: UIImage(systemName: "plus.square")?.pngData()),
            ClothingItem(name: "Acc 2", type: .accessories, size: nil, color: nil, weather: nil, fabric: nil, displayImage: UIImage(systemName: "plus.square")?.pngData()),
            ClothingItem(name: "Acc 3", type: .accessories, size: nil, color: nil, weather: nil, fabric: nil, displayImage: UIImage(systemName: "plus.square")?.pngData())
        ])
    }
    
    var body: some View {
        VStack {
            headerView
            itemSelectionView
            Spacer()
            NameTextField(nameInput: $name) // Placeholder for a custom TextField implementation
            Spacer()
            RoundedButton(onPress: {
                clothesVM.createOutfit(name: name, top: topItem, bottom: bottomItem, jacket: jacketItem, shoes: shoeItem, other: accessoryItems)
                homeVM.navigateTo(screen: .home)
            }, icon: "tray.and.arrow.down")
        }
    }

    private var headerView: some View {
        HStack {
            Button(action: {
                homeVM.returnToHome()
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
                ClosetItemView(closetItem: topItem, onPress: {_ in
                    homeVM.selectedClothingKind = .top
                    homeVM.navigateTo(screen: .selectClothing)
                })
                ClosetItemView(closetItem: jacketItem, onPress: {_ in
                    homeVM.selectedClothingKind = .jacket
                    homeVM.navigateTo(screen: .selectClothing)
                })
            }
            
            HStack(spacing: 15) {
                ClosetItemView(closetItem: bottomItem, onPress: {_ in
                    homeVM.selectedClothingKind = .bottom
                    homeVM.navigateTo(screen: .selectClothing)
                })
                ClosetItemView(closetItem: shoeItem, onPress: {_ in
                    homeVM.selectedClothingKind = .shoes
                    homeVM.navigateTo(screen: .selectClothing)
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
                        ClosetItemView(closetItem: accessoryItems[index], onPress: {_ in
                            homeVM.selectedClothingKind = .accessories
                            selectedAcc = index
                            homeVM.navigateTo(screen: .selectClothing)
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
        OutfitFormView(homeVM: HomeViewModel(), clothesVM: ClothesViewModel())
    }
}

    
