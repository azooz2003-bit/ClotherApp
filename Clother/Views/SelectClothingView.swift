//
//  SelectClothingView.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/7/24.
//

import SwiftUI

struct SelectClothingView: View {
    @ObservedObject var homeVM: HomeViewModel
    @ObservedObject var clothesVM: ClothesViewModel

    var body: some View {
        VStack {
            headerView
            
            if let kind = selectedClothingKind {
                ClosetGrid(onItemPress: { item in handleItemPress(item: item, kind: kind) }, closetItems: filteredClothingItems(for: kind))
            } else {
                Spacer()
                Text("No clothing type selected")
                    .padding()
            }
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
            .padding(.leading)

            Spacer()

            Text("Select Clothing")
                .font(.title2)
                .bold()
                .foregroundColor(Color(red: 0.529, green: 0.553, blue: 0.616))
                .fontDesign(.monospaced)
            
            Spacer()
            
            Image(systemName: "arrow.left")
                .resizable()
                .scaledToFit()
                .frame(width: 26, height: 21)
                .opacity(0)
            .padding(.trailing)
        }
        .padding([.top, .horizontal])
    }
    
    private func filteredClothingItems(for kind: Clothing.Kind) -> [ClothingItem] {
        return clothesVM.clothesOnDisplay.filter { $0.type == kind }
    }

    private func handleItemPress(item: ClothingItem, kind: Clothing.Kind) {
        clothesVM.selectItem(item, for: kind)
        homeVM.navigateBackwards()
    }
}

// Preview for SelectClothingView
struct SelectClothingView_Previews: PreviewProvider {
    static var previews: some View {
        // Create an instance of SelectClothingView within the preview
        SelectClothingView(homeVM: HomeViewModel(), clothesVM: ClothesViewModel())
            .onAppear {
                // Set the global variable when the preview appears
                selectedClothingKind = .top
            }
    }
}
