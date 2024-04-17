//
//  ClothingFormView.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI

struct ClothingFormView: View {
    // TODO: Do the following in this view:
    /*
        - Expect to receive the app's view models.
        - Build the UI. Create any necessary variables/functions.
        - Observe the UI components implemented under subviews folder. Do not reimplement a subview that has been built, use the subviews given to you as much as possible.
        - Don't forget to implement backwards navigation. Utilize the view model functions and variables for navigation. Submitting the form should take us back to the root (HomeView).
     */
    @ObservedObject var homeVM = HomeViewModel()
    @ObservedObject var clothesVM = ClothesViewModel()
    
    @Binding var selectedImage: UIImage?
    @State private var name: String = ""
    
    @State var selectedType: Clothing.Kind?
    @State var selectedColor: Clothing.Color?
    @State var selectedSize: Clothing.Size?
    @State var selectedWeather: Clothing.Weather?
    @State var selectedFabric: Clothing.Fabric?
    
    var body: some View {
        Button(action: {
            homeVM.navigateTo(screen: .uploadClothes)
        }) {
            Image(systemName: "arrow.left")
                .resizable()
                .frame(width: 26, height: 21)
                .foregroundColor(Color(red: 0.53, green: 0.55, blue: 0.62))
        }
        .offset(x: -140)
        VStack (spacing: 10) {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
            }
            NameTextField(nameInput: $name)
            VStack {
                FormDropdown(promptTitle: "Type", selectedItem: $selectedType)
                FormDropdown(promptTitle: "Color", selectedItem: $selectedColor)
                FormDropdown(promptTitle: "Size", selectedItem: $selectedSize)
                FormDropdown(promptTitle: "Weather", selectedItem: $selectedWeather)
                FormDropdown(promptTitle: "Fabric", selectedItem: $selectedFabric)
            }
            RoundedButton(onPress: {
                guard let image = selectedImage else {
                    return
                }
                clothesVM.createClothing(name: name,
                                         image: image.pngData() ?? Data(),
                                         type: selectedType ?? .top,
                                         size: selectedSize ?? .small,
                                         color: selectedColor ?? .black,
                                         weather: selectedWeather ?? .cold,
                                         fabric: selectedFabric ?? .cotton)
            }, icon: "tray.and.arrow.down")
            .padding(.top, 30)
        }
    }
}

#Preview {
    ClothingFormView(selectedImage: .constant(nil))
}
