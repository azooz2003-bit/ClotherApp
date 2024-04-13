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
    @State var displayItems: Bool = true
    
    @State private var selectedServiceIndex = 0
    private let serviceOptions = ["Clothes", "Outfits"]
    
    var body: some View {
        VStack {
            Picker(selection: $selectedServiceIndex, label: Text("Hello")) {
                ForEach(0..<serviceOptions.count, id: \.self) { index in
                    Text(serviceOptions[index])
                        .tag(index)
                }
            }
            .onChange(of: selectedServiceIndex) {oldValue, newValue in
                if serviceOptions[selectedServiceIndex] == "Clothes" {
                    displayItems = true
                } else if serviceOptions[selectedServiceIndex] == "Outfits" {
                    displayItems = false
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.bottom, 5)
            CustomSearchBar(
                searchText: .constant(""),
                onSearch: { _ in print("Search") },
                onSettings: { print("Settings") }
            )
            .padding(.bottom, 5)
            if (displayItems) {
                ClosetGrid<ClothingItem>(onItemPress: { _ in }, closetItems: [.sample])
                RoundedButton(onPress: {}, icon: "plus")
                .padding(.bottom, 15)
            } else if (displayItems == false) {
                ClosetGrid<ClothingItem>(onItemPress: { _ in }, closetItems: [.sample, .sample])
                HStack {
                    RoundedButton(onPress: {}, icon: "hanger")
                        .padding(Edge.Set.horizontal, 25)
                    RoundedButton(onPress: {}, icon: "arrow.up")
                        .padding(Edge.Set.horizontal, 25)
                }
                .padding(.bottom, 15)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

    #Preview {
        HomeView()
    }

