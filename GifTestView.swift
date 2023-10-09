//
//  GifTestView.swift
//  gameApp
//
//  Created by Bora Birlikci on 10.08.2023.
//

import SwiftUI

struct GifTestView: View {
    var body: some View {
        AnimatedGifView(gifName: "spinnning")
            .scaledToFit()
            .frame(maxHeight: 200)
    }
}

struct GifTestView_Previews: PreviewProvider {
    static var previews: some View {
        GifTestView()
    }
}
