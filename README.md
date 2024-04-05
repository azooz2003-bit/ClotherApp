# ClotherApp

## Tasks
Tasks will be assigned via the [Issues](https://github.com/azooz2003-bit/ClotherApp/issues) tab above. You will find your username beside your assigned task.

When implementing a feature, create a new branch for that particular feature. The naming standard for branch should follow a lower-cased pattern separated words by hyphens, and finally the task number (ex: `home-screen-view-1`).
Remember, a branch is simply a copy of the main codebase that you can freely manipulate without affecting the main code. 

#### Git references:
- [Bootcamp Day 2 Slides]()
- [Complete Git Cheat Sheet]()
- Your mentor

## Notes

## Important APIs

### Navigation
It's important that you understand the navigation mechanism we'll be using for this project. SwiftUI offers many different methods of navigation, however a combination of `NavigationStack` and `NavigationPath` suits our app best.

- `NavigationStack`: takes in a root view and a NavigationPath object which the stack responds to
- `.navigationDestination(for: ..., destination: ...)` : responds to a new item added to the NavigationStack's NavigationPath, if the new item matches the type specified after 'for', a jump to the destination is triggered.

```swift
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

```

## Codebase Diagram
