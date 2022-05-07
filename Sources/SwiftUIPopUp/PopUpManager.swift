import SwiftUI

class PopUpManager: ObservableObject {
    @Published var isPresented: Bool = false {
        didSet {
            if !isPresented {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) { [weak self] in
                    self?.content = EmptyView().eraseToAnyView()
                    self?.onDismiss = nil
                }
            }
        }
    }
    
    @Published var content: AnyView
    @Published var offset: (x: CGFloat, y: CGFloat)
    
    private(set) var onDismiss: (() -> Void)?
    
    init() {
        content = EmptyView().eraseToAnyView()
        offset = (x: CGFloat(0), CGFloat(0))
    }
    
    func updateManager<T>(isPresented: Bool,
                          offset: (x: CGFloat, y: CGFloat),
                          content: () -> T,
                          onDismiss: @escaping (() -> Void)) where T: View {
        self.content = AnyView(content())
        self.offset = offset
        self.onDismiss = onDismiss
        self.isPresented = isPresented
    }
}

