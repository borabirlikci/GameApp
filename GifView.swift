import SwiftUI
import ImageIO

struct GifView: View {
    var gifName: String
    
    @State private var animatedImage: UIImage?
    
    var body: some View {
        VStack {
            if let image = animatedImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 200)
            } else {
                Text("Invalid GIF")
            }
        }
        .onAppear {
            loadAnimatedImage()
        }
    }
    
    private func loadAnimatedImage() {
        guard let gifURL = Bundle.main.url(forResource: gifName, withExtension: "gif"),
              let data = try? Data(contentsOf: gifURL) else {
            return
        }
        
        animatedImage = UIImage.gifImageWithData(data)
    }
}
