import Foundation
import UIKit
import SnapKit

class HeaderView: UIView {
    private lazy var headerImage: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.image = UIImage(named: Strings.Images.Ilustrations.womanPets)
        return image
    }()
    
    private let searchView: UISearchBar = {
        let search = UISearchBar(frame: .zero)
        search.placeholder = "Search.."
        search.image(for: .search, state: .normal)
        return search
    }()
}

extension HeaderView: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(headerImage)
        addSubview(searchView)
    }
    
    func setupContraints() {
//        headerImage.snp.makeConstraints {
//            
//        }
    }
}
