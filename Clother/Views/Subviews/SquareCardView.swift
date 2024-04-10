//
//  SquareCardView.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/7/24.
//

import SwiftUI

struct SquareCardView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
            ZStack {
                Color(red: 0.957, green: 0.965, blue: 0.988, opacity: 0.50)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(red: 0.529, green: 0.553, blue: 0.616, opacity: 0.20), lineWidth: 3)
                        )
                
                content
                
            }
            .frame(minWidth: 100, idealWidth: 200, maxWidth: 200, minHeight: 100, idealHeight: 200, maxHeight: 200)
        }
    }

    struct SquareCardView_Previews: PreviewProvider {
        static var previews: some View {

            SquareCardView(content: {
                VStack {
                    Image(systemName: "plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    Text("Top")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.bottom, .leading])
                        
                }
            })
        }
    }
