//
//  AnimatedGifView.swift
//  gameApp
//
//  Created by Bora Birlikci on 10.08.2023.
//

import SwiftUI

struct AnimatedGifView: View {
    var gifName: String

    var body: some View {
        guard let gifImage = UIImage.gifImageWithName(gifName) else {
            return AnyView(Text("Invalid GIF"))
        }

        return AnyView(
            Image(uiImage: gifImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
        )
    }
}
