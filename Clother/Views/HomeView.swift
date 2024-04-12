//
//  HomeView.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI

struct HomeView: View {
    // TODO: this is the entry point of your app. Hence, you must do the following in this view:
    /*
     - Instantiate the app's view models, which will also be shared with all other views.
     - Build the home view UI, which includes the toggle between the 'Clothes' section and 'Outfits' section.
     - Observe the UI components implemented under subviews folder. Do not reimplement a subview that has been built, use the subviews given to you as much as possible.
     - Navigation should also work in this view. This screen can jump to multiple views as shown in Figma. Utilize the view model functions and variables for navigation. Since this is the root view, don't forget to wrap it with a navigation stack.
     - Your view models should be injected into the navigation and subview hierarchies as an 'environment object'.
     */
    @State var displayCameraOptions: Bool = false
    
    var body: some View {
        HStack {
            if (displayCameraOptions) {
                VStack {
                    Spacer()
                    RoundedButton(onPress: {
                        print("Button Pressed")
                    }, icon: "square.and.arrow.up")
                    .padding()
                }
                .background(Color.white)
            }
            VStack {
                Spacer()
                RoundedButton(onPress: {
                    withAnimation(.smooth) {
                        displayCameraOptions.toggle()
                    }
                }, icon: displayCameraOptions ? "x.circle.fill" : "camera")
                .padding()
            }
            .background(Color.white)
            if (displayCameraOptions) {
                VStack {
                    Spacer()
                    RoundedButton(onPress: {
                        print("Button Pressed")
                    }, icon: "camera")
                    .padding()
                }
                .background(Color.white)
            }
            
        }
    }
    
}

#Preview {
    HomeView()
}
