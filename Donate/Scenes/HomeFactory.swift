import UIKit

enum HomeFactory {
    static func make() -> HomeViewController {
        let coordinator: HomeCoordinating = HomeCoordinator()
        let presenter: HomePresenting = HomePresenter(coordinator: coordinator)
        let interactor = HomeInteractor(presenter: presenter)
        let viewController = HomeViewController(interactor: interactor)
        
        presenter.viewController = viewController
        coordinator.viewController = viewController
        
        return viewController
    }
}
