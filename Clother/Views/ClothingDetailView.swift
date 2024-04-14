//
//  ClothingDetailView.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI

struct ClothingDetailView: View {
    // TODO: Do the following in this view:
    /*
     - Expect to receive the app's view models.
     - Build the UI. Create any necessary variables/functions.
     - Observe the UI components implemented under subviews folder. Do not reimplement a subview that has been built, use the subviews given to you as much as possible.
     - Don't forget to implement backwards navigation. Utilize the view model functions and variables for navigation.
     */
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            Button(action: {
                viewModel.returnToHome()
            }) {
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 26, height: 21)
                    .foregroundColor(Color(red: 0.53, green: 0.55, blue: 0.62))
                
            }
            .padding()
            .offset(x: -140, y: -230)
            Text("Name of Clothing")
                .font(.title2)
                .bold()
                .foregroundColor(Color(red: 0.529, green: 0.553, blue: 0.616))
                .fontDesign(.monospaced)
            ClosetItemView(closetItem: ClothingItem.sample, onPress: {
                print($0)
            })
            HStack (spacing: 12){
                Text("Type")
                    .font(.system(size: 10))
                    .foregroundColor(Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 0.60))
                    .frame(width: 60, height: 20)
                    .background(Color(red: 0.957, green: 0.965, blue: 0.988, opacity: 1.0))
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 0.20), lineWidth: 3)
                    )
                    .font(.headline)
                    .fontDesign(.monospaced)
                    .bold()
                Text("Size")
                    .font(.system(size: 10))
                    .foregroundColor(Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 0.60))
                    .frame(width: 60, height: 20)
                    .background(Color(red: 0.957, green: 0.965, blue: 0.988, opacity: 1.0))
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 0.20), lineWidth: 3)
                    )
                    .font(.headline)
                    .fontDesign(.monospaced)
                    .bold()
                Text("Color")
                    .font(.system(size: 10))
                    .foregroundColor(Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 0.60))
                    .frame(width: 60, height: 20)
                    .background(Color(red: 0.957, green: 0.965, blue: 0.988, opacity: 1.0))
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 0.20), lineWidth: 3)
                    )
                    .font(.headline)
                    .fontDesign(.monospaced)
                    .bold()
                Text("Style")
                    .font(.system(size: 10))
                    .foregroundColor(Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 0.60))
                    .frame(width: 60, height: 20)
                    .background(Color(red: 0.957, green: 0.965, blue: 0.988, opacity: 1.0))
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 0.20), lineWidth: 3)
                    )
                    .font(.headline)
                    .fontDesign(.monospaced)
                    .bold()
                Text("Weather")
                    .font(.system(size: 10))
                    .foregroundColor(Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 0.60))
                    .frame(width: 60, height: 20)
                    .background(Color(red: 0.957, green: 0.965, blue: 0.988, opacity: 1.0))
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 0.20), lineWidth: 3)
                    )
                    .font(.headline)
                    .fontDesign(.monospaced)
                    .bold()
            }
            .padding(.top)
        }
    }
}
#Preview {
    ClothingDetailView()
}
