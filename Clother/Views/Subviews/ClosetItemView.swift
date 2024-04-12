//
//  OutfitItemView.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI

struct ClosetItemView<T>: View where T : ClosetItem {
    
    // The outfit whose information we want to display.
    let closetItem: T
    // A custom closure or functionality to be executed upon clicking on this item view. Takes in the closet item being displayed.
    let onPress: (T) -> Void
    
    var body: some View {
        Button(action: {
            onPress(closetItem)
        }) {
            ZStack (alignment: .bottomLeading) {
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.99))
                        
                        if let imageData = closetItem.displayImage, let uiImage = UIImage(data: imageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 125, height: 125)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 125, height: 125)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                    .frame(width:175, height:175)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color(red: 0.53, green: 0.55, blue: 0.62).opacity(0.25), lineWidth: 6)
                    )
                }
                HStack {
                    Text(closetItem.name)
                        .bold()
                        .fontDesign(.monospaced)
                        .foregroundColor(Color(red: 0.53, green: 0.55, blue: 0.62))
                        .font(.system(size: 16))
                }
                .offset(x:14, y:-8)
            }
        }
    }
}


#Preview {
    ClosetItemView(closetItem: ClothingItem.sample, onPress: {
        print($0)
    })
}
