# ClotherApp

## Tasks
Tasks will be assigned via the [Issues](https://github.com/azooz2003-bit/ClotherApp/issues) tab above. You will find your username beside your assigned task.

When implementing a feature, create a new branch for that particular feature. The naming standard for branch should follow a lower-cased pattern separated words by hyphens. EX: `home-screen-view`
Remember, a branch is simply a copy of the main codebase that you can freely manipulate without affecting the main code. 

## Notes

Important APIs for the project:
- `NavigationStack`: takes in a root view and a NavigationPath object which the stack responds to
- `.navigationDestination(for: ..., destination: ...)` : responds to a new item added to the NavigationStack's NavigationPath, if the new item matches the type specified after 'for', a jump to the destination is triggered.
