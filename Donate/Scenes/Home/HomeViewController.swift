import UIKit
import SnapKit


protocol HomeDisplaying: AnyObject {
    
}

final class HomeViewController: UIViewController {
    private let interactor: HomeInteracting
    
    private let headerView = HeaderView()
    
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: generateLayout())
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = UIColor(named: Strings.Color.white)
        collection.register(SpeciesCollectionViewCell.self, forCellWithReuseIdentifier: "speciesCell")
        collection.register(DonateCollectionViewCell.self, forCellWithReuseIdentifier: "donateCell")
        collection.layer.cornerRadius = 20
        return collection
    }()
    
    private lazy var footerImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: Strings.Images.Ilustrations.familyPets)
        return image
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
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func generateLayout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            return self.generateCellLayout()
        }
    }
}

extension HomeViewController {
    func generateCellLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(140), heightDimension: .absolute(100))
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
    //Aqui ainda será implementado conforme coisas que vierem do interactor
}

extension HomeViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(headerView)
        view.addSubview(collectionView)
        view.addSubview(footerImage)
    }
    
    func setupContraints() {
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.leading.equalToSuperview()
            $0.height.equalTo(300)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.trailing.leading.bottom.equalToSuperview()
        }
        
        footerImage.snp.makeConstraints {
            $0.height.equalTo(200)
            $0.bottom.equalTo(collectionView.snp.bottom)
            $0.trailing.leading.equalTo(collectionView).inset(20)
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("click")
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard indexPath.section == 0 else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "donateCell", for: indexPath) as? DonateCollectionViewCell
            return cell ?? UICollectionViewCell()
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "speciesCell", for: indexPath) as? SpeciesCollectionViewCell
        return cell ?? UICollectionViewCell()
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        if kind == "Espécies" {
//            print("batata")
//        } VAMO DEIXA AQUI PORQUE VOU PRECISAR CRIAR AS SECTIONS
//        return UICollectionReusableView()
//    }
}
