//
//  SquareCardView.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/7/24.
//

import SwiftUI

struct SquareCardView: View {
    
    // The image to be displayed under the text. If nil, the light blue background should be used as in the design.
    let image: Image?
    // The bottom left text component from the design. Is nil if no text is desired.
    let subHeading: String?
    
    var body: some View {
            ZStack {
                if let image = image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } else {
                    Color(red: 0.957, green: 0.965, blue: 0.988, opacity: 0.50)
                        .cornerRadius(20)
                        .frame(minWidth: 100, idealWidth: 200, maxWidth: 200, minHeight: 100, idealHeight: 200, maxHeight: 200)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 0.20), lineWidth: 3)
                            )
                    
                }
            }
        }
    }

    struct SquareCardView_Previews: PreviewProvider {
        static var previews: some View {
            SquareCardView(image: nil, subHeading: "Top")
        }
    }
