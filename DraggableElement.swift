//
//  DraggableElement.swift
//  gameApp
//
//  Created by Bora Birlikci on 1.08.2023.
//

import SwiftUI

struct DraggableElement: Identifiable, Equatable {
    let id = UUID()
    let imageName: String

    // Implement the Equatable protocol
    static func == (lhs: DraggableElement, rhs: DraggableElement) -> Bool {
        return lhs.id == rhs.id
    }
}
