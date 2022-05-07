import SwiftUI

public extension View {
    func popup<Content: View>(isPresented: Binding<Bool>,
                              offset: (x: CGFloat, y: CGFloat),
                              @ViewBuilder content: @escaping () -> Content) -> some View {
        Popup(isPresented: isPresented, content: content, offset: offset, parent: self)
    }
    
    func attachPopupToRoot() -> some View {
        let manager: PopUpManager = PopUpManager()

        return modifier(PopUpModifier())
            .environmentObject(manager)
    }
}
