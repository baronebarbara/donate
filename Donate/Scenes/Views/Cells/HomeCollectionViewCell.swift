import UIKit
import SnapKit

class HomeCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "HomeCollectionViewCell"
    let cellImage = UIImageView()
    
    init() {
        super.init(frame: .zero)
        buildLayout()
    }
    
    required init?(coder: NSCoder) { nil }
    
    func setUp(image: UIImage) {
        cellImage.image = image
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
    
    func configureViews() {
        cellImage.backgroundColor = .magenta
    }
}
