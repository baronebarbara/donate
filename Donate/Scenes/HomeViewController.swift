import UIKit
import SnapKit

protocol HomeDisplaying: AnyObject {
    
}

final class HomeViewController: UIViewController {
    private let interactor: HomeInteracting
    
    private let headerView = HeaderView()
    
    func configureCollectionView() {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: generateLayout())
        view.addSubview(collection)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = UIColor(named: Strings.Color.purple)
        collection.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    init(interactor: HomeInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: Strings.Color.background)
        configureCollectionView()
        buildLayout()
    }
    
    func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            return self.generateHomeCellLayout()
        }
        return layout
    }
}

extension HomeViewController {
    func generateHomeCellLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(140), heightDimension: .absolute(186))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: "Espécies", alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
}

extension HomeViewController: HomeDisplaying {
    
}

extension HomeViewController: ViewConfiguration {
    func configureViews() {
    
    }
    
    func buildViewHierarchy() {
        view.addSubview(headerView)
    }
    
    func setupContraints() {
        
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("click")
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? HomeCollectionViewCell
        
        return cell ?? UICollectionViewCell()
    }
}
