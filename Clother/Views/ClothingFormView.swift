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
    var homeVM: HomeViewModel
    var clothesVM: ClothesViewModel
    
    @Binding var selectedImage: UIImage?
    @State private var name: String = ""
    
    @State var selectedType: Clothing.Kind?
    @State var selectedColor: Clothing.Color?
    @State var selectedSize: Clothing.Size?
    @State var selectedWeather: Clothing.Weather?
    @State var selectedFabric: Clothing.Fabric?
    
    init(homeVM: HomeViewModel, clothesVM: ClothesViewModel, selectedImage: Binding<UIImage?>) {
            self.homeVM = homeVM
            self.clothesVM = clothesVM
            self._selectedImage = selectedImage
    }
    
    var body: some View {
        Button(action: {
            homeVM.navigateBackwards()
        }) {
            Image(systemName: "arrow.left")
                .resizable()
                .frame(width: 26, height: 21)
                .foregroundColor(Color(red: 0.53, green: 0.55, blue: 0.62))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 25)
        .padding(.vertical)
        
        VStack (spacing: 10) {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(ClotherStyle.CustomColor.foggyBlue)
                    .stroke(
                        ClotherStyle.CustomColor.gray,
                        lineWidth: 3
                    )
                    .frame(width: 325, height: 325)
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
            }
            NameTextField(nameInput: $name)
            ScrollView {
                VStack {
                    FormDropdown(promptTitle: "Type", selectedItem: $selectedType)
                    FormDropdown(promptTitle: "Color", selectedItem: $selectedColor)
                    FormDropdown(promptTitle: "Size", selectedItem: $selectedSize)
                    FormDropdown(promptTitle: "Weather", selectedItem: $selectedWeather)
                    FormDropdown(promptTitle: "Fabric", selectedItem: $selectedFabric)
                }
                .padding(.vertical, 5)
                .frame(maxWidth: .infinity)
            }
            RoundedButton(onPress: {
                if let image = selectedImage {
                    clothesVM.createClothing(name: name,
                                             image: image.pngData() ?? Data(),
                                             type: selectedType ?? .top,
                                             size: selectedSize ?? .small,
                                             color: selectedColor ?? .black,
                                             weather: selectedWeather ?? .cold,
                                             fabric: selectedFabric ?? .cotton)
                    homeVM.navigateBackwards()
                }
            }, icon: "tray.and.arrow.down")
        }
    }
}

#Preview {
    ClothingFormView(homeVM: HomeViewModel(), clothesVM: ClothesViewModel(), selectedImage: .constant(nil))
}
