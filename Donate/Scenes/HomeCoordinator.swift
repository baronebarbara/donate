import Foundation
import UIKit

enum HomeCoordinatorAction: Equatable {
    case back
}

protocol HomeCoordinating: AnyObject {
    var viewController: UIViewController? { get set }
    func perform(action: HomeCoordinatorAction)
}

final class HomeCoordinator {
    weak var viewController: UIViewController?
}

extension HomeCoordinator: HomeCoordinating {
    func perform(action: HomeCoordinatorAction) {
    
    }
}
