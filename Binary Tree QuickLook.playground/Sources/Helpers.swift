import UIKit

extension CGRect {
    public init(center: CGPoint, size: CGSize) {
        origin = CGPoint(x: center.x-size.width/2, y: center.y-size.height/2)
        self.size = size
    }
}

extension CGContext {
    public func drawLine(from start: CGPoint, to end: CGPoint, color: UIColor = .black, width: CGFloat = 1) {
        saveGState()
        move(to: start)
        addLine(to: end)
        color.setStroke()
        setLineWidth(width)
        strokePath()
        restoreGState()
    }
}

extension String {
    public func draw(center: CGPoint, attributes: [NSAttributedStringKey: Any]) {
        let size = (self as NSString).size(withAttributes: attributes)
        let bounds = CGRect(center: center, size: size)
        (self as NSString).draw(in: bounds, withAttributes: attributes)
    }
}
