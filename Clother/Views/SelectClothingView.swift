//
//  SelectClothingView.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/7/24.
//

import SwiftUI

struct SelectClothingView: View {
    // TODO: Do the following in this view:
    /*
        - Expect to receive the app's view models.
        - Build the UI. Create any necessary variables/functions.
        - This screen will behave a bit differently. In that once the user confirms a selected clothing, they should navigate backwards.
        - Observe the UI components implemented under subviews folder. Do not reimplement a subview that has been built, use the subviews given to you as much as possible.
        - Don't forget to implement backwards navigation. Utilize the view model functions and variables for that.
     */
    @State var selected: Clothing.Color? = nil
    var body: some View {
        FormDropdown(promptTitle: "Color", selectedItem: $selected)
        FormDropdown(promptTitle: "Color", selectedItem: $selected)
    }
}

#Preview {
    SelectClothingView()
}
