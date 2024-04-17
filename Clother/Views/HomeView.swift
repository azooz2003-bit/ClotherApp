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
    @StateObject var homeVM = HomeViewModel()
    @StateObject var clothesVM = ClothesViewModel()
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack(path: $homeVM.navPath) {
            HStack {
                ForEach(HomeScreen.allCases, id: \.self) { item in
                    VStack {
                        Text(item.title)
                            .bold()
                            .foregroundColor(item == homeVM.activeHomeScreen ?
                                             Color(red: 0.53, green: 0.55, blue: 0.62) : Color(red: 0.53, green: 0.55, blue: 0.62).opacity(0.75))
                            .fontDesign(.monospaced)
                            .font(.system(size: 16))
                        
                        if homeVM.activeHomeScreen == item {
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
                        withAnimation(.smooth, {
                            homeVM.activeHomeScreen = item
                        })
                    }
                }
            }
            .navigationDestination(for: Screen.self, destination: { pathElement in
                switch pathElement {
                case Screen.outfitForm:
                    OutfitFormView().navigationBarBackButtonHidden()
                case Screen.uploadClothes:
                    UploadClothesView().navigationBarBackButtonHidden()
                case Screen.randomizedOutfitForm:
                    RandomOutfitFormView().navigationBarBackButtonHidden()
                case Screen.detailedOutfit:
                    OutfitDetailView(homeVM: homeVM, clothesVM: clothesVM).navigationBarBackButtonHidden()
                case Screen.detailedClothing:
                    ClothingDetailView(homeVM: homeVM, clothesVM: clothesVM).navigationBarBackButtonHidden()
                default:
                    HomeView()
                }
            })
            
            CustomSearchBar(
                searchText: $searchText,
                onSearch: {
                    _ in clothesVM.search(input: searchText)
                }, onSettings: {
                    print("Settings")
                })
            .padding(.top)
            
            
            if (homeVM.activeHomeScreen == .clothes) {
                ClosetGrid<ClothingItem>(onItemPress: {
                    _ in homeVM.navigateTo(screen: .detailedClothing)
                    
                }, closetItems: clothesVM.clothesOnDisplay)
            } else {
                ClosetGrid<OutfitItem>(onItemPress: {
                    _ in homeVM.navigateTo(screen: .detailedOutfit)
                    
                }, closetItems: clothesVM.outfitsOnDisplay)
            }
            
            if (homeVM.activeHomeScreen == .clothes) {
                RoundedButton(onPress: {
                    homeVM.navigateTo(screen: .uploadClothes)
                }, icon: "camera")
                    .previewLayout(.sizeThatFits)
                    .transition(.slide.combined(with: .opacity))
            } else {
                HStack (spacing: 75){
                    RoundedButton(onPress: {
                        homeVM.navigateTo(screen: .outfitForm)
                    }, icon: "hanger")
                        .previewLayout(.sizeThatFits)
                    RoundedButton(onPress: {
                        homeVM.navigateTo(screen: .randomizedOutfitForm)
                    }, icon: "plus")
                        .previewLayout(.sizeThatFits)
                }
                .transition(.slide.combined(with: .opacity))
            }
            
        }
    }
}

#Preview {
    HomeView()
}

