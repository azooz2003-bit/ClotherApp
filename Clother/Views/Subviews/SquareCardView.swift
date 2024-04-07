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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SquareCardView(image: nil, subHeading: "Top")
}
