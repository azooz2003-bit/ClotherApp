//
//  HomeView.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI

struct HomeView: View {
    // TODO: this is the entry point of your app. Hence, you must do the following in this view:
    /*
     - Instantiate the app's view models, which will also be shared with all other views.
     - Build the home view UI, which includes the toggle between the 'Clothes' section and 'Outfits' section.
     - Observe the UI components implemented under subviews folder. Do not reimplement a subview that has been built, use the subviews given to you as much as possible.
     - Navigation should also work in this view. This screen can jump to multiple views as shown in Figma. Utilize the view model functions and variables for navigation. Since this is the root view, don't forget to wrap it with a navigation stack.
     - Your view models should be injected into the navigation and subview hierarchies as an 'environment object'.
     */
    @ObservedObject var viewModel = HomeViewModel()
    @ObservedObject var clothesModel = ClothesViewModel()
    
    var body: some View {
        VStack {
            HStack {
                ForEach(HomeScreen.allCases, id: \.self) { item in
                    VStack {
                        Text(item.title)
                            .bold()
                            .foregroundColor(item == viewModel.activeHomeScreen ?
                                             Color(red: 0.53, green: 0.55, blue: 0.62) : Color(red: 0.53, green: 0.55, blue: 0.62).opacity(0.75))
                            .fontDesign(.monospaced)
                            .font(.system(size: 16))
                        if viewModel.activeHomeScreen == item {
                            Capsule()
                                .fill(Color(red: 0.53, green: 0.55, blue: 0.62))
                                .frame(height: 4)
                        } else {
                            Capsule()
                                .fill(Color(red: 0.90, green: 0.91, blue: 0.93))
                                .frame(height: 4)
                        }
                    }
                    .onTapGesture {
                        viewModel.activeHomeScreen = item
                    }
                }
            }
            CustomSearchBar(
                searchText: .constant(""),
                onSearch: { _ in print("Search") },
                onSettings: { print("Settings") }
            )
            .padding(.top)
            if (viewModel.activeHomeScreen == .clothes) {
                ClosetGrid<ClothingItem>(onItemPress: {
                    _ in
                    
                }, closetItems: clothesModel.clothesOnDisplay)
            } else {
                ClosetGrid<OutfitItem>(onItemPress: {
                    _ in
                    
                }, closetItems: clothesModel.outfitsOnDisplay)
            }
            if (viewModel.activeHomeScreen == .clothes) {
                RoundedButton(onPress: {}, icon: "camera")
                    .previewLayout(.sizeThatFits)
            } else {
                HStack (spacing: 75){
                    RoundedButton(onPress: {}, icon: "hanger")
                        .previewLayout(.sizeThatFits)
                    RoundedButton(onPress: {}, icon: "plus")
                        .previewLayout(.sizeThatFits)
                }
            }
            
        }
    }
}
    #Preview {
        HomeView()
    }

