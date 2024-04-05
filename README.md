# ClotherApp

## Tasks
Tasks will be assigned via the [Issues](https://github.com/azooz2003-bit/ClotherApp/issues) tab above. You will find your username beside your assigned task.

When implementing a feature, create a new branch for that particular feature. The naming standard for branch should follow a lower-cased pattern, separated words by hyphens, and followed by the task number (ex: `home-screen-view-1`).
Remember, a branch is simply a copy of the main codebase that you can freely manipulate without affecting the main code. 

#### Git references:
- [Bootcamp Day 2 Slides](https://file.notion.so/f/f/cac72556-53f5-45c8-92b0-965dabb6f4d1/767c936c-a374-40d9-a090-f2b3e414de0f/iOS_Bootcamp_Week_1_Day_2.pdf?id=62d222ae-6d44-4a1e-86b2-89b92760b065&table=block&spaceId=cac72556-53f5-45c8-92b0-965dabb6f4d1&expirationTimestamp=1712383200000&signature=aatV108an8u-Qy8nT5D0rnQuCYOFs1JO1_jjY20bJdw&downloadName=iOS_Bootcamp_Week_1_Day_2.pdf)
- [Complete Git Cheat Sheet](https://wac-cdn.atlassian.com/dam/jcr:e7e22f25-bba2-4ef1-a197-53f46b6df4a5/SWTM-2088_Atlassian-Git-Cheatsheet.pdf?cdnVersion=1538)
- Your mentor

## Notes

## Important APIs

### Navigation
It's important that you understand the navigation mechanism we'll be using for this project. SwiftUI offers many different methods of navigation, however a combination of `NavigationStack` and `NavigationPath` suits our app best.

- `NavigationStack`: takes in a root view and a `NavigationPath` object which the stack responds to. The root view is simply the starting screen with which you'll enable navigation. When the navigation path is empty, the root view is displayed. The navigation path offers a seamless way of returning to prior screens and jumping to new ones.
- `.navigationDestination(for: ..., destination: ...)` : responds to a new item added to the NavigationStack's NavigationPath, if the new item matches the type specified after 'for', a jump to the destination is triggered. That destination corresponds to the last element in the path.

```swift
struct NavigationExample: View {

    // An empty navigation path is initialized, we will append elements as we want to move to new screens, and pop elements whenever we want to backtrack
    @State var path = NavigationPath()
    
    var body: some View {
        // The stack we wrap around our starting screen. It enables all the necessary interactions for navigation.
        NavigationStack(path: $path, root: {
            
            Button("Click to go to next number", action: {

                // Adding an element to the end of the path, prompts a jump to a new screen
                path.append(Int.random(in: 0...1000))
                
            }) // Determines the destination UI upon appending an integer to the path, as indicated by 'for: Int.self'
            .navigationDestination(for: Int.self, destination: { pathElement in
                
                Button("\(pathElement). Click to go to next number", action: {
                    // Prompts a jump to another screen
                    path.append(Int.random(in: 0...1000))
                })
                
                Button("Back") {
                    // Prompts a return to the prior screen
                    path.removeLast()
                }
                
            })
            
            
        })
        
    }
}

```

## Codebase Diagram
