//
//  FilterView.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/18/24.
//

import SwiftUI

struct FilterView: View {
    
    @Binding var toggleSheet: Bool
    
    @Binding var typeFilter: Clothing.Kind?
    @Binding var sizeFilter: Clothing.Size?
    @Binding var colorFilter: Clothing.Color?
    @Binding var weatherFilter: Clothing.Weather?
    @Binding var fabricFilter: Clothing.Fabric?
    
    @Binding var currentHomeScreen: HomeScreen
    
    let onConfirm: () -> Void
    
    var body: some View {
        VStack {
            Text("Filter")
                .font(.title2)
                .bold()
                .foregroundColor(Color(red: 0.529, green: 0.553, blue: 0.616))
                .fontDesign(.monospaced)
                .frame(maxWidth: .infinity, alignment: .center)
            ScrollView {
                VStack {
                    
                    if currentHomeScreen == .clothes {
                        FormDropdown(promptTitle: "Type", selectedItem: $typeFilter)
                    }
                    FormDropdown(promptTitle: "Size", selectedItem: $sizeFilter)
                    FormDropdown(promptTitle: "Color", selectedItem: $colorFilter)
                    FormDropdown(promptTitle: "Weather", selectedItem: $weatherFilter)
                    FormDropdown(promptTitle: "Fabric", selectedItem: $fabricFilter)

                }
                .padding(.top)
                .frame(maxWidth: .infinity)

            }
            
            RoundedRectangleButton(onPress: onConfirm, buttonText: "Confirm")
        }
        .padding(.top, 45)

        
    }
}

#Preview {
    VStack {
        
    }.sheet(isPresented: .constant(true), content: {
        FilterView(toggleSheet: .constant(true), typeFilter: .constant(.accessories), sizeFilter: .constant(.medium), colorFilter: .constant(.black), weatherFilter: .constant(.cold), fabricFilter: .constant(.wool), currentHomeScreen: .constant(.clothes), onConfirm: {
            print("good")
        })
            .presentationDetents([.height(400), .large])
    })
}
