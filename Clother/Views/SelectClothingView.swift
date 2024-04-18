//
//  SelectClothingView.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/7/24.
//

import SwiftUI

struct SelectClothingView: View {
    @StateObject var homeVM: HomeViewModel
    @StateObject var clothesVM: ClothesViewModel
    
    @Binding var selectedAcc: Int?

    var body: some View {
        VStack {
            headerView
            if let kind = homeVM.selectedClothingKind {
                ClosetGrid(onItemPress: { item in
                    handleItemPress(item: item, kind: kind)
                }, closetItems: filteredClothingItems(for: kind))
            } else {
                Spacer()
                Text("No clothing type selected")
                    .padding()
            }
        }
    }

    private var headerView: some View {
        ZStack {
            Button(action: homeVM.navigateBackwards) {
                Image(systemName: "arrow.left")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 26, height: 21)
                    .foregroundColor(Color(red: 0.53, green: 0.55, blue: 0.62))
            }
            .offset(x: 25)
            .frame(maxWidth: .infinity,alignment: .leading)

            Text("Select Clothing")
                .font(.title2)
                .bold()
                .foregroundColor(Color(red: 0.529, green: 0.553, blue: 0.616))
                .fontDesign(.monospaced)
                .frame(maxWidth: .infinity, alignment: .center)

            Spacer()
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding([.top])
    }

    private func filteredClothingItems(for kind: Clothing.Kind) -> [ClothingItem] {
        return clothesVM.clothesOnDisplay.filter { $0.type == kind }
    }

    private func handleItemPress(item: ClothingItem, kind: Clothing.Kind) {
        if kind == .accessories, let index = selectedAcc {
            clothesVM.updateAccessoryItem(item, for: index)
        } else {
            clothesVM.updateItem(item, for: kind)
        }
        homeVM.navigateBackwards()
    }
}

struct SelectClothingView_Previews: PreviewProvider {
    @State var selectedAcc: Int?
    
    static var previews: some View {
        SelectClothingView(homeVM: HomeViewModel(), clothesVM: ClothesViewModel(), selectedAcc: .constant(nil))
    }
}

