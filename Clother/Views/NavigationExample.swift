//
//  SwiftUIView.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/4/24.
//

import SwiftUI


//IGNORE
struct NavigationExample: View {
    
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path, root: {
            
            Button("Click to go to next number", action: {
                
                path.append(Int.random(in: 0...1000))
                
            })
            .navigationDestination(for: Int.self, destination: { pathElement in
                
                Button("\(pathElement). Click to go to next number", action: {
                    path.append(Int.random(in: 0...1000))
                })
                
                Button("Back") {
                    path.removeLast()
                }
                
            })
            
            
        })
        
    }
}

#Preview {
    NavigationExample()
}
