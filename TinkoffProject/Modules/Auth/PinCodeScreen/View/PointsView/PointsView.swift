import UIKit

@IBDesignable class PointsView: UIView {
    
    @IBInspectable var pointsCount: Int = 4 {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable var pointSize: CGFloat = 12 {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable var spacing: CGFloat = 4 {
        didSet {
            setupView()
        }
    }
    
    private var points: [UIView] = []
    
    override var intrinsicContentSize: CGSize {
        let width = CGFloat(pointsCount) * pointSize + CGFloat(pointsCount - 1) * spacing
        let height = pointSize
        return CGSize(width: width, height: height)
    }
    
    override func prepareForInterfaceBuilder() {
        invalidateIntrinsicContentSize()
    }
    
    func setupView() {
        points.forEach { $0.removeFromSuperview() }
        points.removeAll()
        translatesAutoresizingMaskIntoConstraints = false
        for index in 0..<pointsCount {
            addPoint(at: index)
        }
    }
    
    private func addPoint(at index: Int) {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = pointSize / 2
        view.backgroundColor = .lightGray
        points.append(view)
        addSubview(view)
        
        view.heightAnchor.constraint(equalToConstant: pointSize).isActive = true
        view.widthAnchor.constraint(equalToConstant: pointSize).isActive = true
        view.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        let xPosition = (CGFloat(index) * (pointSize + spacing))
        view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: xPosition).isActive = true
    }
    
    func fill(numberOfPoints: Int) {
        guard numberOfPoints <= pointsCount else {
            return
        }
        
        for index in 0..<numberOfPoints {
            points[index].backgroundColor = .blue
        }
        for index in numberOfPoints..<pointsCount {
            points[index].backgroundColor = .lightGray
        }
    }
    
    func highlight(color: UIColor = .red, completion: (() -> Void)? = nil) {
        UIView.animate(withDuration: 0.3, animations: {
            self.points.forEach { $0.backgroundColor = color }
        }, completion: { _ in
            completion?()
        })
    }
    
    func clear() {
        points.forEach { $0.backgroundColor = .lightGray }
    }
}
