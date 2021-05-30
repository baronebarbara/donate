import UIKit
import SnapKit

protocol HomeDisplaying: AnyObject {
    
}

final class HomeViewController: UIViewController {
    private let interactor: HomeInteracting
    
    private let headerView = HeaderView()
    
    private let collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero)
        collection.autoresizingMask = [.flexibleHeight, .flexibleWidth]
       // collection.delegate = self
        collection.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.reuseIdentifier)
        return collection
    }()
    
    init(interactor: HomeInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: Strings.Color.background)
        buildLayout()
    }
    
//    func generateLayout() -> UICollectionViewLayout {
//        return nil
//    }
}

extension HomeViewController: HomeDisplaying {
    
}

extension HomeViewController: ViewConfiguration {
    func configureViews() {
    
    }
    
    func buildViewHierarchy() {
        view.addSubview(headerView)
        view.addSubview(collectionView)
    }
    
    func setupContraints() {
        
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("click")
    }
}

//extension HomeViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//    }
//}
