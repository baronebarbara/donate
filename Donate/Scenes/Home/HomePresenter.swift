import Foundation

protocol HomePresenting: AnyObject {
    var viewController: HomeDisplaying? { get set }
    func didSelect()
}

final class HomePresenter {
    weak var viewController: HomeDisplaying?
    private let coordinator: HomeCoordinating
    
    init(coordinator: HomeCoordinating) {
        self.coordinator = coordinator
    }
}

extension HomePresenter: HomePresenting {
    func didSelect() {
        coordinator.perform(action: .open)
    }
}
