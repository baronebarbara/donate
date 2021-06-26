import SnapKit
import UIKit

class DonateCollectionViewCell: UICollectionViewCell {
    private lazy var cellImage: UIImageView = {
        let image = UIImageView()
//        image.image = UIImage(named: Strings.Images.Ilustrations.womanBird)
        image.backgroundColor = .magenta
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        cellImage.backgroundColor = .blue
        buildLayout()
    }
    
//    func setUp(image: UIImage) {
//        cellImage.image = image
//    }
}

extension DonateCollectionViewCell: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(cellImage)
    }
    
    func setupContraints() {
        cellImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
