/*import UIKit
import ImageIO

extension UIImage {
    static func gifImageWithData(_ data: Data) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else {
            return nil
        }
        
        var images: [UIImage] = []
        var delays: [Double] = []
        
        for i in 0..<CGImageSourceGetCount(source) {
            if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                let uiImage = UIImage(cgImage: cgImage)
                images.append(uiImage)
                delays.append(delayForImageAtIndex(Int(i), source: source))
            }
        }
        
        let duration: Double = delays.reduce(0.0, +)
        
        return UIImage.animatedImage(with: images, duration: duration)
    }
    
    private static func delayForImageAtIndex(_ index: Int, source: CGImageSource) -> Double {
        var delay = 0.1
        
        guard let properties = CGImageSourceCopyPropertiesAtIndex(source, index, nil) as? [String: Any],
              let gifProperties = properties[kCGImagePropertyGIFDictionary as String] as? [String: Any],
              let unclampedDelayTime = gifProperties[kCGImagePropertyGIFUnclampedDelayTime as String] as? Double
        else {
            return delay
        }
        
        delay = unclampedDelayTime
        
        if delay < 0.1 {
            delay = 0.1
        }
        
        return delay
    }
}
*/
