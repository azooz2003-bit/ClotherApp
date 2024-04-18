////
////  UploadClothesView.swift
////  Clother
////
////  Created by Abdulaziz Albahar on 4/4/24.
////
//
//import SwiftUI
//
//    // TODO: Do the following in this view:
//    /*
//        - Expect to receive the app's view models.
//        - Build the UI. Create any necessary variables/functions.
//        - Observe the UI components implemented under subviews folder. Do not reimplement a subview that has been built, use the subviews given to you as much as possible.
//        - Navigation should also work in this view. This screen can jump to a certain view as shown in Figma. Utilize the view model functions and variables for navigation. Don't forget to implement backwards navigation.
//     */
//struct UploadClothesView: View {
//    
//    @ObservedObject var homeVM: HomeViewModel
//    @ObservedObject var clothesVM: ClothesViewModel
//    
//    @State var isImagePickerShown = false
//    @State var isImageTakerShown = false
//    @State var selectedImage: UIImage?
//    
//    var body: some View {
//        NavigationStack(path: $homeVM.navPath) {
//            VStack {
//                HStack(spacing: 20) {
//                    RoundedRectangleButton(onPress: {
//                        isImageTakerShown.toggle()
//                        homeVM.navigateTo(screen: .clothingForm)
//                    }, buttonText: "Take Photo")
//                    .sheet(isPresented: $isImageTakerShown) {
//                        ImagePicker(image: $selectedImage, isShown: $isImageTakerShown, sourceType: .camera)
//                    }
//                    RoundedRectangleButton(onPress: {
//                        isImagePickerShown.toggle()
//                        homeVM.navigateTo(screen: .clothingForm)
//                    }, buttonText: "Upload Photo")
//                    .sheet(isPresented: $isImagePickerShown) {
//                        ImagePicker(image: $selectedImage, isShown: $isImagePickerShown, sourceType: .photoLibrary)
//                    }
//                }
//                RoundedButton(onPress: {
//                    clothesVM.createClothing(name: "we", image: UIImage(systemName: "photo")!.pngData()! , type: .accessories, size: .medium, color: .black, weather: .cold, fabric: .cotton)
//                    
//                }, icon: "tray.and.arrow.down")
//            }
//            .navigationDestination(for: Screen.self, destination: { pathElement in
//                switch pathElement {
//                case Screen.outfitForm:
//                    OutfitFormView(homeVM: homeVM, clothesVM: clothesVM).navigationBarBackButtonHidden()
//                case Screen.uploadClothes:
//                    UploadClothesView(homeVM: homeVM, clothesVM: clothesVM)
//                case Screen.randomizedOutfitForm:
//                    RandomOutfitFormView().navigationBarBackButtonHidden()
//                case Screen.detailedOutfit:
//                    OutfitDetailView(homeVM: homeVM, clothesVM: clothesVM).navigationBarBackButtonHidden()
//                case Screen.detailedClothing:
//                    ClothingDetailView(homeVM: homeVM, clothesVM: clothesVM).navigationBarBackButtonHidden()
//                case Screen.clothingForm:
//                    ClothingFormView(homeVM: homeVM, clothesVM: clothesVM, selectedImage: .constant(nil))
//                case Screen.confirmRandomizedOutfit:
//                    ConfirmRandomOutfitView()
//                case Screen.selectClothing:
//                    SelectClothingView(homeVM: homeVM, clothesVM: clothesVM, selectedAcc: .constant(0))
//                case Screen.home:
//                    HomeView(homeVM: .init(), clothesVM: .init())
//                }
//            })
//        }
//    }
//}
//#Preview {
//    UploadClothesView(homeVM: HomeViewModel(), clothesVM: ClothesViewModel())
//}
