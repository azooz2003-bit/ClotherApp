//
//  FormEntry.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI

struct FormDropdown<T: Property>: View {

    let promptTitle: String
    @Binding var selectedItem: T?

    var options: [T] {
        T.allCases as! [T]
    }

    @State var showDropdown: Bool = false
    @State var chevronResource: String = "chevron.up"
    
    let customColor = ClotherStyle.CustomColor.self

    var body: some View {
        VStack {
            Button(action: {
                chevronResource = chevronResource == "chevron.up" ? "chevron.down" : "chevron.up"
                withAnimation(.smooth){
                    self.showDropdown.toggle()
                }
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(customColor.skyBlue)
                        .stroke(customColor.lightGray, lineWidth: 3)
                        
                    HStack {
                        Text(selectedItem?.id ?? "Select \(promptTitle)")
                            .fontDesign(.monospaced)
                            .foregroundStyle(Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 0.60))
                            .padding(.leading, 20)
                        
                        Spacer()
                        
                        Image(systemName: chevronResource)
                            .foregroundColor(Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 0.60))
                            .padding(.trailing, 20)
                    }
                }
                .frame(height: 40)
            }
            
            if showDropdown {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(options, id: \.id) { option in
                        Button(action: {
                            print("Selected: \(option.id)")
                            withAnimation {
                                self.selectedItem = option
                            }
                        }) {
                            Text(option.id)
                                .fontDesign(.monospaced)
                                .foregroundStyle(
                                    selectedItem == option ? 
                                    Color(red: 0.22, green: 0.71, blue: 1)
                                                        :
                                    Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 0.60)
                                )
                                .padding(.leading, 20)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .overlay{
                                    if selectedItem == option {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(customColor.laserBlue)
                                            .frame(width: 340, height: 35)
                                    }
                                }
                        }
                       
                    }
                }
                .padding(.vertical, 15)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(red: 0.957, green: 0.965, blue: 0.988))
                        .stroke(Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 0.20), lineWidth: 3)
                        
                )
                .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
        .frame(width: 360)
    }
}

#Preview {
    @State var selected: Clothing.Color? = .black
    
    return FormDropdown<Clothing.Color>(promptTitle: "color", selectedItem: $selected)
}
