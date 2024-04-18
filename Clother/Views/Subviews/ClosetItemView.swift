//
//  OutfitItemView.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI

struct ClotherStyle {
    struct GridCell {
        static let maxHeight: CGFloat = 175
        static let maxWidth: CGFloat = 175
        static let minHeight: CGFloat = 100
        static let minWidth: CGFloat = 100
        static let horizontalSpacing: CGFloat = 15
    }
    
    struct Grid {
        static let sideSpacing: CGFloat = 18
    }
    
    struct CustomColor {
        static let skyBlue = Color(red: 0.957, green: 0.965, blue: 0.988, opacity: 1.0)
        static let lightGray = Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 0.20)
        static let foggyBlue = Color(red: 0.956, green: 0.964, blue: 0.988)
        static let gray = Color(red: 0.53, green: 0.55, blue: 0.62).opacity(0.25)
        static let darkGray = Color(red: 0.53, green: 0.55, blue: 0.62)
        static let laserBlue = Color(red: 0.22, green: 0.71, blue: 1).opacity(0.25)
    }
}

struct ClosetItemView<T>: View where T : ClosetItem {
 
    
    // The outfit whose information we want to display.
    let closetItem: T
    
    // A custom closure or functionality to be executed upon clicking on this item view. Takes in the closet item being displayed.
    let onPress: (T) -> Void
    
    var image: Image {
        if let imageData = closetItem.displayImage, let uiImage = UIImage(data: imageData) {
            return Image(uiImage: uiImage)
        } else  { return Image(systemName: "tshirt.fill") }
    }
    
    let cell = ClotherStyle.GridCell.self
    
    var body: some View {
        Button(action: {
            onPress(closetItem)
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(ClotherStyle.CustomColor.foggyBlue)
                    .stroke(
                        ClotherStyle.CustomColor.gray,
                        lineWidth: 3
                    )                
                
                VStack {
                   
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(10)
                        .foregroundStyle(.gray)
                    
                    

                    Text(closetItem.name)
                        .bold()
                        .fontDesign(.monospaced)
                        .foregroundColor(ClotherStyle.CustomColor.darkGray)
                        .font(.system(size: 16))
                        .frame(maxWidth: .infinity, alignment: .bottomLeading)
                        .padding([.leading, .bottom], 9)
                    
                }
                
            }                            
            .frame(minWidth: cell.minWidth, maxWidth: cell.maxWidth, minHeight: cell.minHeight, maxHeight: cell.maxHeight)
            // ClotherStyle.GridCell is the global struct which contains information for standardized stylings.
        }
    }
}


#Preview {
    ClosetItemView(closetItem: ClothingItem.sample, onPress: {
        print($0)
    })
}
