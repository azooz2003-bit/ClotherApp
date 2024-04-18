//
//  ConfirmRandomOutfitView.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI
/*
struct ConfirmRandomOutfitView: View {
    // TODO: Do the following in this view:
    /*
        - Expect to receive the app's view models.
        - Build the UI. Create any necessary variables/functions.
        - Observe the UI components implemented under subviews folder. Do not reimplement a subview that has been built, use the subviews given to you as much as possible.
        - Navigation should also work in this view. This screen can jump to a certain view as shown in Figma. Utilize the view model functions and variables for navigation. Don't forget to implement backwards navigation.  Submitting the form should take us back to the root (HomeView).
     */
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ConfirmRandomOutfitView()
}
*/



import SwiftUI

struct CreateOutfitView: View {
    @ObservedObject var homeVM: HomeViewModel
    @ObservedObject var clothesVM: ClothesViewModel
    
    @State private var nameInput: String = ""
    @State private var topItem: ClothingItem
    @State private var jacketItem: ClothingItem
    @State private var bottomItem: ClothingItem
    @State private var shoeItem: ClothingItem
    @State private var accessoryItems: [ClothingItem]
    
    public init(homeVM: HomeViewModel, clothesVM: ClothesViewModel, topItem: ClothingItem, jacketItem: ClothingItem, bottomItem: ClothingItem, shoeItem: ClothingItem, accessoryItems: [ClothingItem]) {
            self.homeVM = homeVM
            self.clothesVM = clothesVM
            self._topItem = State(initialValue: topItem)
            self._jacketItem = State(initialValue: jacketItem)
            self._bottomItem = State(initialValue: bottomItem)
            self._shoeItem = State(initialValue: shoeItem)
            self._accessoryItems = State(initialValue: accessoryItems)
        }
    
    var body: some View {
        VStack {
            headerView
            itemSelectionView
            Spacer()
            NameTextField(nameInput: $nameInput) // Placeholder for a custom TextField implementation
            Spacer()
            RoundedButton(onPress: {
                clothesVM.createOutfit(name: nameInput, top: topItem, bottom: bottomItem, jacket: jacketItem, shoes: shoeItem, other: accessoryItems)
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

            Text("Selected Outfit")
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
    /*
    private let topGridItems = [GridItem(.flexible()), GridItem(.flexible())]
    private let accessoryItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
*/
    
    /*var body: some View {
        VStack {
            HStack {
                Image(systemName: "arrow.left")
                    .foregroundColor(.gray)
                    .padding(.leading, 20)
                Spacer()
                Text("Create Outfit")
                    .font(.system(size: 24, weight: .bold, design: .monospaced))
                    .frame(alignment: .center)
                    .padding()
                Spacer()
            }

            ScrollView {
                VStack(spacing: 16) {
                    LazyVGrid(columns: topGridItems, spacing: 20) {
                        ForEach(["Top", "Jacket", "Bottom", "Shoes"], id: \.self) { item in
                            SquareCardView {
                                VStack {
                                    Image(systemName: "plus")
                                        .resizable()
                                        .scaledToFit()
                                        .padding(20)
                                    Text(item)
                                        .font(.system(.body, design: .monospaced))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 20)
                                }
                            }
                            .frame(width: 170, height: 170)
                        }
                    }
                    .padding(.horizontal)
                    
                    Text("Accessories")
                        .font(.system(size: 18, weight: .medium, design: .monospaced))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.horizontal)

                    LazyVGrid(columns: accessoryItems, spacing: 15) {
                        ForEach(0..<3) { _ in
                            SquareCardView {
                                Image(systemName: "plus")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(20)
                            }
                            .frame(width: 100, height: 100)
                        }
                    }
                    .padding(.horizontal)

                    NameTextField(nameInput: nameInput)
                        .padding(.top,20)

                    RoundedButton(onPress: {
                    }, icon: "arrow.down.circle.fill")
                        .padding(.top, 10)
                }
            }
        }
        .navigationBarHidden(true)
    }
}
*/

struct CreateOutfitView_Previews: PreviewProvider {
    static var previews: some View {
        let topItem1 = ClothingItem.sample
        let jacketItem1 = ClothingItem.sample
        let bottomItem1 = ClothingItem.sample
        let shoeItem1 = ClothingItem.sample
        let accessoryItems1 = [ClothingItem.sample, ClothingItem.sample, ClothingItem.sample]
        CreateOutfitView(homeVM: HomeViewModel(), clothesVM: ClothesViewModel(), topItem: topItem1, jacketItem: jacketItem1, bottomItem: bottomItem1, shoeItem: shoeItem1, accessoryItems: accessoryItems1)
    }
}
