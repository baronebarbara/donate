import UIKit
import SnapKit

class HomeCollectionViewCell: UICollectionViewCell {
    let cellImage = UIImageView()
    
    func setUp(image: UIImage) {
        cellImage.image = image
        buildLayout()
    }
}

extension HomeCollectionViewCell: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(cellImage)
    }
    
    func setupContraints() {
        cellImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configureViews() { }
}
