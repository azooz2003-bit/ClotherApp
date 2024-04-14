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
    
    var image: Image {
        if let imageData = viewModel.clothingOnDisplay?.displayImage, let uiImage = UIImage(data: imageData) {
            return Image(uiImage: uiImage)
        } else  { return Image(systemName: "photo") }
    }
    
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
            .offset(x: -140, y: -125)
            Text(viewModel.clothingOnDisplay?.name ?? "Name of Clothing")
                .font(.title2)
                .bold()
                .foregroundColor(Color(red: 0.529, green: 0.553, blue: 0.616))
                .fontDesign(.monospaced)
                .padding(.bottom, 30)
            SquareCardView(content: {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .frame(width: 300, height: 300)
            })
            .frame(width: 300, height: 300)
            VStack {
                TypeCapsule(property: viewModel.clothingOnDisplay?.type ?? Clothing.Kind.top)
                HStack (spacing: 10){
                    Capsule(property: viewModel.clothingOnDisplay?.size ?? Clothing.Size.small)
                    Capsule(property: viewModel.clothingOnDisplay?.color ?? Clothing.Color.red)
                    Capsule(property: viewModel.clothingOnDisplay?.fabric ?? Clothing.Fabric.cotton)
                    Capsule(property: viewModel.clothingOnDisplay?.weather ?? Clothing.Weather.warm)
                }
                .padding(.top, 3)
            }
            .padding(.top, 30)
        }
    }
}
private func Capsule<T: Property>(property: T) -> some View {
    Text(property.id.capitalizedFirstLetter)
        .font(.system(size: 10))
        .foregroundColor(Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 0.60))
        .frame(width: 65, height: 20)
        .background(Color(red: 0.957, green: 0.965, blue: 0.988, opacity: 1.0))
        .cornerRadius(15)
        .font(.headline)
        .fontDesign(.monospaced)
        .bold()
}
private func TypeCapsule<T: Property>(property: T) -> some View {
    Text(property.id.capitalizedFirstLetter)
        .font(.system(size: 10))
        .foregroundColor(Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 0.60))
        .frame(width: 80, height: 20)
        .background(Color(red: 0.957, green: 0.965, blue: 0.988, opacity: 1.0))
        .cornerRadius(15)
        .font(.headline)
        .fontDesign(.monospaced)
        .bold()
}
extension String {
    var capitalizedFirstLetter: String {
        guard let first = first else { return self }
        return String(first).uppercased() + dropFirst()
    }
}
#Preview {
    ClothingDetailView()
}
