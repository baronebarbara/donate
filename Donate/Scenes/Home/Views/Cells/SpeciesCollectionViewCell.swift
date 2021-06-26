import UIKit
import SnapKit

class SpeciesCollectionViewCell: UICollectionViewCell {
    private lazy var cellImage: UIImageView = {
        let image = UIImageView()
//        image.image = UIImage(named: Strings.Images.Ilustrations.womanBird)
        image.backgroundColor = .blue
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        cellImage.backgroundColor = .magenta
        buildLayout()
    }
    
//    func setUp(image: UIImage) {
//        cellImage.image = image
//    }
}

extension SpeciesCollectionViewCell: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(cellImage)
    }
    
    func setupContraints() {
        cellImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
