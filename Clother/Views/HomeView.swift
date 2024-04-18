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
    @State var buttonPressed: Bool = false
    
    @State var isImagePickerShown = false
    @State var isImageTakerShown = false
    @State var selectedImage: UIImage?
    @State var uploadedSelectedImage: UIImage?
    @State var takenSelectedImage: UIImage?
    @State var displayNext = false
    
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
                    OutfitFormView(homeVM: homeVM, clothesVM: clothesVM).navigationBarBackButtonHidden()
                case Screen.randomizedOutfitForm:
                    RandomOutfitFormView().navigationBarBackButtonHidden()
                case Screen.detailedOutfit:
                    OutfitDetailView(homeVM: homeVM, clothesVM: clothesVM).navigationBarBackButtonHidden()
                case Screen.detailedClothing:
                    ClothingDetailView(homeVM: homeVM, clothesVM: clothesVM).navigationBarBackButtonHidden()
                case Screen.clothingForm:
                    ClothingFormView(homeVM: homeVM, clothesVM: clothesVM, selectedImage: $selectedImage).navigationBarBackButtonHidden()
                default:
                    Color(.black)
                }
            })
            CustomSearchBar(
                searchText: $searchText,
                onSearch: {
                    _ in clothesVM.search(input: searchText)
                }, onSettings: {
                    clothesVM.createClothing(name: "we", image: UIImage(systemName: "photo")!.pngData()! , type: .accessories, size: .medium, color: .black, weather: .cold, fabric: .cotton)
                    print(clothesVM.clothesOnDisplay)
                })
            .padding(.top)
            
            
            if (homeVM.activeHomeScreen == .clothes) {
                ClosetGrid<ClothingItem>(onItemPress: {
                    item in
                    homeVM.clothingOnDisplay = item
                    homeVM.navigateTo(screen: .detailedClothing)
                    
                }, closetItems: clothesVM.clothesOnDisplay)
            } else {
                ClosetGrid<OutfitItem>(onItemPress: {
                    item in
                    homeVM.outfitOnDisplay = item
                    homeVM.navigateTo(screen: .detailedOutfit)
                    
                }, closetItems: clothesVM.outfitsOnDisplay)
            }
            
            if (homeVM.activeHomeScreen == .clothes) {
                HStack (spacing: 30){
                    if (buttonPressed) {
                        RoundedButton(onPress: {
                            isImageTakerShown.toggle()
                            displayNext.toggle()
                        }, icon: "camera")
                        .sheet(isPresented: $isImageTakerShown) {
                            ImagePicker(image: $takenSelectedImage, isShown: $isImageTakerShown, sourceType: .camera)
                        }
                    }
                    if (!buttonPressed) {
                        RoundedButton(onPress: {
                            withAnimation (.bouncy) {
                                buttonPressed.toggle()
                            }
                        }, icon: "camera")
                            .previewLayout(.sizeThatFits)
                        .transition(.slide.combined(with: .opacity))
                    } else {
                        RoundedButton(onPress: {
                            buttonPressed.toggle()
                        }, icon: "x.circle")
                            .previewLayout(.sizeThatFits)
                        .transition(.slide.combined(with: .opacity))
                    }
                    if (buttonPressed) {
                        RoundedButton(onPress: {
                            isImagePickerShown.toggle()
                            displayNext.toggle()
                        }, icon: "tray.and.arrow.up")
                        .sheet(isPresented: $isImagePickerShown) {
                            ImagePicker(image: $selectedImage, isShown: $isImagePickerShown, sourceType: .photoLibrary)
                        }
                    }
                }
                .onChange(of: selectedImage, perform: { _ in
                homeVM.navigateTo(screen: .clothingForm)
            })
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

