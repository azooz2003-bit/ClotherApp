//
//  UploadClothesView.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI

    // TODO: Do the following in this view:
    /*
        - Expect to receive the app's view models.
        - Build the UI. Create any necessary variables/functions.
        - Observe the UI components implemented under subviews folder. Do not reimplement a subview that has been built, use the subviews given to you as much as possible.
        - Navigation should also work in this view. This screen can jump to a certain view as shown in Figma. Utilize the view model functions and variables for navigation. Don't forget to implement backwards navigation.
     */
struct UploadClothesView: View {
    
    var homeVM = HomeViewModel()
    
    @State var isImagePickerShown = false
    @State var isImageTakerShown = false
    @State var selectedImage: UIImage?
    
    init(homeVM: HomeViewModel, isImagePickerShown: Bool = false, isImageTakerShown: Bool = false, selectedImage: UIImage? = nil) {
        self.homeVM = homeVM
        self.isImagePickerShown = isImagePickerShown
        self.isImageTakerShown = isImageTakerShown
        self.selectedImage = selectedImage
    }
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                RoundedRectangleButton(onPress: {
                    isImageTakerShown.toggle()
                }, buttonText: "Take Photo")
                .sheet(isPresented: $isImageTakerShown) {
                    ImagePicker(image: $selectedImage, isShown: $isImageTakerShown, sourceType: .camera)
                }
                RoundedRectangleButton(onPress: {
                    isImagePickerShown.toggle()
                }, buttonText: "Upload Photo")
                .sheet(isPresented: $isImagePickerShown) {
                    ImagePicker(image: $selectedImage, isShown: $isImagePickerShown, sourceType: .photoLibrary)
                }
            }
            if selectedImage != nil {
                NavigationLink(destination: ClothingFormView(homeVM: HomeViewModel(), clothesVM: ClothesViewModel(), selectedImage: $selectedImage)) {
                }
            }
        }
    }
}
#Preview {
    UploadClothesView(homeVM: HomeViewModel())
}
