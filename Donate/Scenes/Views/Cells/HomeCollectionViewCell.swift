import UIKit
import SnapKit

class HomeCollectionViewCell: UICollectionViewCell {
    let cellImage: UIImageView = {
        var image = UIImageView()
        
        return image
    }()
    
    func setUp() {
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
