import Foundation

protocol HomeInteracting: AnyObject {
    func doSomething()
}

final class HomeInteractor {
    private let presenter: HomePresenting
    
    init(presenter: HomePresenting) {
        self.presenter = presenter
    }
}

extension HomeInteractor: HomeInteracting {
    func doSomething() { }
}
