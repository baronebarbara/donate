import Foundation
import UIKit
import SnapKit

class HeaderView: UIView {
    private lazy var headerImage: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.image = UIImage(named: Strings.Images.Ilustrations.womanPets)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let searchView: UISearchBar = {
        let search = UISearchBar(frame: .zero)
        search.placeholder = "Search.."
        search.tintColor = .gray
        search.image(for: .search, state: .normal)
        return search
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }
    
    required init?(coder: NSCoder) { nil }
}

extension HeaderView: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(headerImage)
        addSubview(searchView)
    }
    
    func setupContraints() {
        headerImage.snp.makeConstraints {
            $0.trailing.leading.top.equalToSuperview().inset(20)
            $0.height.equalTo(200)
        }
        
        searchView.snp.makeConstraints {
            $0.top.equalTo(headerImage.snp.bottom)
            $0.trailing.leading.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
    }
}
