//
//  FormEntry.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI

struct FormDropdown<T: Clothing.Property>: View {

    let promptTitle: String
    @State var selectedItem: T?

    var options: [T] {
        T.allCases as! [T]
    }

    @State var showDropdown: Bool = false

    var body: some View {
        VStack {
            Button(action: {
                self.showDropdown.toggle()
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 0.20), lineWidth:3)
                    HStack {
                        Text(selectedItem?.id ?? "Select \(promptTitle)")
                            .fontDesign(.monospaced)
                            .foregroundStyle(Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 0.60))
                            .padding(.leading, 20)
                        
                        Spacer()
                        
                        Image(systemName: showDropdown ? "chevron.up" : "chevron.down")
                            .foregroundColor(Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 0.60))
                            .padding(.trailing, 20)
                    }
                }
                .frame(width: 360, height: 40)
                .background(Color(red: 0.957, green: 0.965, blue: 0.988, opacity: 1.0))
            }
            
            if showDropdown {
                VStack(alignment: .leading) {
                    ForEach(options, id: \.id) { option in
                        Button(action: {
                            print("Selected: \(option.id)")
                            self.selectedItem = option
                            self.showDropdown = false
                        }) {
                            Text(option.id)
                                .fontDesign(.monospaced)
                                .foregroundStyle(Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 0.60))
                                .padding(.leading, 20)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.vertical, 1)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(self.selectedItem == option ? Color(red: 0.22, green: 0.553, blue: 0.616, opacity: 0.60) : Color.clear, lineWidth: 2)
                                .frame(maxWidth: 340, minHeight: 30)
                        )
                    }
                }
                .padding(.vertical, 5)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(red: 0.957, green: 0.965, blue: 0.988))
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 0.20), lineWidth: 3)
                        )
                )
                .frame(maxWidth: 360)
            }
        }
    }
}

#Preview {
    FormDropdown<Clothing.Color>(promptTitle: "color")
}
