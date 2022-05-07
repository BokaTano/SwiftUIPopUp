import SwiftUI

public extension View {
    func popup<Content: View>(isPresented: Binding<Bool>,
                              offset: (x: CGFloat, y: CGFloat),
                              @ViewBuilder content: @escaping () -> Content) -> some View {
        Popup(isPresented: isPresented, content: content, offset: offset, parent: self)
    }
    
    internal func attachPopupToRoot(_ manager: PopUpManager) -> some View {
        modifier(PopUpModifier())
            .environmentObject(manager)
    }
}
