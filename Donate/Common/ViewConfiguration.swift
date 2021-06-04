import Foundation

protocol ViewConfiguration {
    func buildViewHierarchy()
    func setupContraints()
    func configureViews()
}

extension ViewConfiguration {
    func buildLayout() {
        buildViewHierarchy()
        setupContraints()
    }
    
    func configureViews() { }
}
