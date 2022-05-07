import SwiftUI

struct Popup<Parent: View, Content: View>: View {
    @EnvironmentObject var manager: PopUpManager
    @Binding var isPresented: Bool
    
    let content: () -> Content
    let offset: (x: CGFloat, y: CGFloat)
    let parent: Parent
    
    @available(macOS 11.0, *)
    var body: some View {
        parent
            .onChange(of: isPresented, perform: { _ in updateContent() })
    }
    
    func updateContent() {
        manager.updateManager(isPresented: isPresented,
                              offset: offset,
                              content: content,
                              onDismiss: { self.isPresented = false })
    }
}

