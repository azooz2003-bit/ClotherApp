//
//  OutfitFormView.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI

var selectedClothingKind: Clothing.Kind?
var selectedAcc: Int?

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
    
    var topItem = ClothingItem(name: "Top", type: .top, size: nil, color: nil, weather: nil, fabric: nil, displayImage: UIImage(systemName: "plus.square")?.pngData())
    var jacketItem = ClothingItem(name: "Jacket", type: .bottom, size: nil, color: nil, weather: nil, fabric: nil, displayImage: UIImage(systemName: "plus.square")?.pngData())
    var bottomItem = ClothingItem(name: "Bottom", type: .bottom, size: nil, color: nil, weather: nil, fabric: nil, displayImage: UIImage(systemName: "plus.square")?.pngData())
    var shoeItem = ClothingItem(name: "Shoes", type: .shoes, size: nil, color: nil, weather: nil, fabric: nil, displayImage: UIImage(systemName: "plus.square")?.pngData())
    var accItem1 = ClothingItem(name: "Acc 1", type: .accessories, size: nil, color: nil, weather: nil, fabric: nil, displayImage: UIImage(systemName: "plus.square")?.pngData())
    var accItem2 = ClothingItem(name: "Acc 2", type: .accessories, size: nil, color: nil, weather: nil, fabric: nil, displayImage: UIImage(systemName: "plus.square")?.pngData())
    var accItem3 = ClothingItem(name: "Acc 3", type: .accessories, size: nil, color: nil, weather: nil, fabric: nil, displayImage: UIImage(systemName: "plus.square")?.pngData())
    
    var body: some View {
        VStack {
            headerView
            itemSelectionView
            Spacer()
            NameTextField() // Placeholder for a custom TextField implementation
            Spacer()
            RoundedButton(onPress: { homeVM.navigateTo(screen: .home) }, icon: "tray.and.arrow.down")
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
                    selectedClothingKind = .top
                    homeVM.navigateTo(screen: .selectClothing)
                })
                ClosetItemView(closetItem: jacketItem, onPress: {_ in
                    selectedClothingKind = .jacket
                    homeVM.navigateTo(screen: .selectClothing)
                })
            }
            
            HStack(spacing: 15) {
                ClosetItemView(closetItem: bottomItem, onPress: {_ in
                    selectedClothingKind = .bottom
                    homeVM.navigateTo(screen: .selectClothing)
                })
                ClosetItemView(closetItem: shoeItem, onPress: {_ in
                    selectedClothingKind = .shoes
                    homeVM.navigateTo(screen: .selectClothing)
                })
            }
            .padding(.bottom, 10)
            
            VStack(spacing: 15) {
                Text("Accessories")
                    .bold()
                    .foregroundColor(Color(red: 0.529, green: 0.553, blue: 0.616))
                    .fontDesign(.monospaced)
                    .font(.system(size: 16))
                    .padding(.bottom, 5)
                HStack(spacing: 10) {
                    ClosetItemView(closetItem: accItem1, onPress: {_ in
                        selectedClothingKind = .accessories
                        selectedAcc = 1
                        homeVM.navigateTo(screen: .selectClothing)
                    })
                    ClosetItemView(closetItem: accItem2, onPress: {_ in
                        selectedClothingKind = .accessories
                        selectedAcc = 2
                        homeVM.navigateTo(screen: .selectClothing)
                    })
                    ClosetItemView(closetItem: accItem3, onPress: {_ in
                        selectedClothingKind = .accessories
                        selectedAcc = 3
                        homeVM.navigateTo(screen: .selectClothing)
                    })
                }.frame(width: 100, height: 100)
            }
            .padding(.horizontal)
        }
    }

    private func itemSelectionView(_ kind: Clothing.Kind) -> some View {
        VStack {
            if let item = clothesVM.selectedItems[kind] { // Direct access to `selectedItems`
                Text(item.name)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(10)
            } else {
                Button(action: {
                    homeVM.navigateTo(screen: .selectClothing)
                }) {
                    Text("Select \(kind.id.capitalized)")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(10)
                }
            }
        }
        .padding(.horizontal)
    }
}

// Preview for OutfitFormView
struct OutfitFormView_Previews: PreviewProvider {
    static var previews: some View {
        OutfitFormView(homeVM: HomeViewModel(), clothesVM: ClothesViewModel())
    }
}
