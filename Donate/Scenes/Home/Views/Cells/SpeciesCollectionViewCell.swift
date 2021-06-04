import UIKit
import SnapKit

class SpeciesCollectionViewCell: UICollectionViewCell {
    let cellImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        buildLayout()
    }
    
    func setUp(image: UIImage) {
        cellImage.image = image
    }
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
    
    func configureViews() {
        cellImage.backgroundColor = .magenta
    }
}
