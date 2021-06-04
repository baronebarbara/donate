import SnapKit
import UIKit

class DonateCollectionViewCell: UICollectionViewCell {
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

extension DonateCollectionViewCell: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(cellImage)
    }
    
    func setupContraints() {
        cellImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configureViews() {
        cellImage.backgroundColor = .blue
    }
}
