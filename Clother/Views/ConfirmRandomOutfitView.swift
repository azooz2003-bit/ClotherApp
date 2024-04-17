//
//  ConfirmRandomOutfitView.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI
/*
struct ConfirmRandomOutfitView: View {
    // TODO: Do the following in this view:
    /*
        - Expect to receive the app's view models.
        - Build the UI. Create any necessary variables/functions.
        - Observe the UI components implemented under subviews folder. Do not reimplement a subview that has been built, use the subviews given to you as much as possible.
        - Navigation should also work in this view. This screen can jump to a certain view as shown in Figma. Utilize the view model functions and variables for navigation. Don't forget to implement backwards navigation.  Submitting the form should take us back to the root (HomeView).
     */
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ConfirmRandomOutfitView()
}
*/

import SwiftUI

struct CreateOutfitView: View {
    @State private var nameInput: String = ""

    private let topGridItems = [GridItem(.flexible()), GridItem(.flexible())]
    private let accessoryItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "arrow.left")
                    .foregroundColor(.gray)
                    .padding(.leading, 20)
                Spacer()
                Text("Create Outfit")
                    .font(.system(size: 24, weight: .bold, design: .monospaced))
                    .frame(alignment: .center)
                    .padding()
                Spacer()
            }

            ScrollView {
                VStack(spacing: 16) {
                    LazyVGrid(columns: topGridItems, spacing: 20) {
                        ForEach(["Top", "Jacket", "Bottom", "Shoes"], id: \.self) { item in
                            SquareCardView {
                                VStack {
                                    Image(systemName: "plus")
                                        .resizable()
                                        .scaledToFit()
                                        .padding(20)
                                    Text(item)
                                        .font(.system(.body, design: .monospaced))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 20)
                                }
                            }
                            .frame(width: 170, height: 170)
                        }
                    }
                    .padding(.horizontal)
                    
                    Text("Accessories")
                        .font(.system(size: 18, weight: .medium, design: .monospaced))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.horizontal)

                    LazyVGrid(columns: accessoryItems, spacing: 15) {
                        ForEach(0..<3) { _ in
                            SquareCardView {
                                Image(systemName: "plus")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(20)
                            }
                            .frame(width: 100, height: 100)
                        }
                    }
                    .padding(.horizontal)

                    NameTextField(nameInput: nameInput)
                        .padding(.top,20)

                    RoundedButton(onPress: {
                    }, icon: "arrow.down.circle.fill")
                        .padding(.top, 10)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct CreateOutfitView_Previews: PreviewProvider {
    static var previews: some View {
        CreateOutfitView()
    }
}




