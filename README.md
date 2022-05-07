# SwiftUIPopUp

SwiftUIPopUp is a the SwiftUI way to implement pop ups in your app. 
Credits go to [PartialSheet](https://github.com/AndreaMiotto/PartialSheet) for great deal of inspiration.


## Features
* Custom popup content
* Popup grows with content size
* The popup can be moved with an offset

## Manual

1. Step: Register the PopUpManager on your root view

```swift
@main
struct YourApp: App {
    @StateObject var popupManager = PopUpManager()

    var body: some Scene {
        MainView()
            .attachPopupToRoot(popupManager)
    }
}
```

2. Step: Add the method ```popup() {...}``` to your SwiftUI View
```swift
@State var timerPopUpIsPresented = false
...
LowLevelView()
    .popup(isPresented: $isPresented,
               offset: (x: x, y: y)) {
            YourCustomPopupView()
        }
```
