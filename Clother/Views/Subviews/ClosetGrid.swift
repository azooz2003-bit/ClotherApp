//
//  ClothesGridView.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI

struct ClosetGrid<T>: View where T : ClosetItem  {
    
    // A custom closure or functionality to be executed upon clicking on a grid item. Takes in the selected closet item.
    let onItemPress: (T) -> Void
    // The closet items to be displayed in this grid.
    let closetItems: [T]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [.init(.adaptive(minimum: 140, maximum: .infinity), spacing: 0)], spacing: 40) {
                ForEach(closetItems.indices) { idx in
                    Button(action: {
                        onItemPress(closetItems[idx])
                    }) {
                        ZStack (alignment: .bottomLeading) {
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.99))
                                    
                                    if let imageData = closetItems[0].displayImage, let uiImage = UIImage(data: imageData) {
                                        Image(uiImage: uiImage)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 100, height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                    } else {
                                        Image(systemName: "photo")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 100, height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                    }
                                }
                                .frame(width:150, height:150)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color(red: 0.53, green: 0.55, blue: 0.62).opacity(0.25), lineWidth: 6)
                                )
                            }
                            HStack {
                                Text(closetItems[0].name)
                                    .bold()
                                    .fontDesign(.monospaced)
                                    .foregroundColor(Color(red: 0.53, green: 0.55, blue: 0.62))
                                    .font(.system(size: 16))
                            }
                            .offset(x:12, y:-6)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ClosetGrid<ClothingItem>(onItemPress: {
        _ in
        
    }, closetItems: [.sample, .sample, .sample, .sample, .sample,.sample, .sample, .sample, .sample, .sample])
}
