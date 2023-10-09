import SwiftUI

class DraggableElementWrapper: ObservableObject, Identifiable, Equatable {
    let id = UUID()
    @Published var element: DraggableElement

    init(_ element: DraggableElement) {
        self.element = element
    }

    // Implement Equatable for DraggableElementWrapper
    static func == (lhs: DraggableElementWrapper, rhs: DraggableElementWrapper) -> Bool {
        return lhs.id == rhs.id
    }
}
