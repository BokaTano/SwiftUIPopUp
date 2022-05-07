import SwiftUI

struct PopUpModifier: ViewModifier {
    @EnvironmentObject var manager: PopUpManager
    
    func body(content: Content) -> some View {
        content
            .padding(.top)
            .allowsHitTesting(!manager.isPresented)
            .overlay(alignment: .topLeading) {
                if manager.isPresented {
                    popUp()
                }
            }
    }
    
    func popUp() -> some View {
        ZStack(alignment: .topLeading) {
            Color.gray.opacity(0.1)
                .onTapGesture { manager.isPresented ? dismiss() : nil }
                .edgesIgnoringSafeArea(.vertical)
            manager.content
                .background(Color.systemBackground.opacity(1))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(color: .gray.opacity(0.3), radius: 20, x: 0, y: 0)
                .offset(x: manager.offset.x, y: manager.offset.y)
        }
    }
    
    private func dismiss() {
        print("onDismiss")
        manager.isPresented = false
        if let onDismiss = manager.onDismiss { onDismiss() }
    }
}
