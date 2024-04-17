//
//  RandomOutfitFormView.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI

/*struct RandomOutfitFormView: View {
    // TODO: Do the following in this view:
    /*
        - Expect to receive the app's view models.
        - Build the UI. Create any necessary variables/functions.
        - Observe the UI components implemented under subviews folder. Do not reimplement a subview that has been built, use the subviews given to you as much as possible.
        - Navigation should also work in this view. This screen can jump to a certain view as shown in Figma. Utilize the view model functions and variables for navigation. Don't forget to implement backwards navigation.
     */
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    RandomOutfitFormView()
}
*/
import SwiftUI

struct RandomOutfitFormView: View {
    @State private var selectedKind: Clothing.Kind?
    @State private var selectedSize: Clothing.Size?
    @State private var selectedColor: Clothing.Color?
    @State private var selectedWeather: Clothing.Weather?
    @State private var selectedFabric: Clothing.Fabric?

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            FormDropdown(promptTitle: "Size", selectedItem: $selectedSize)
            FormDropdown(promptTitle: "Color", selectedItem: $selectedColor)
            FormDropdown(promptTitle: "Weather", selectedItem: $selectedWeather)
            FormDropdown(promptTitle: "Fabric", selectedItem: $selectedFabric)
            
            RoundedRectangleButton(onPress: randomizeSelection, buttonText: "Randomize")
            
            Spacer()
        }
        .navigationBarTitle("Random Outfit Generator")
        .padding()
    }

    private func randomizeSelection() {
        selectedKind = Clothing.Kind.allCases.randomElement()
        selectedSize = Clothing.Size.allCases.randomElement()
        selectedColor = Clothing.Color.allCases.randomElement()
        selectedWeather = Clothing.Weather.allCases.randomElement()
        selectedFabric = Clothing.Fabric.allCases.randomElement()
    }
}

struct RandomOutfitFormView_Previews: PreviewProvider {
    static var previews: some View {
        RandomOutfitFormView()
    }
}

