import ModernRIBs
import UIKit

protocol FinanceHomePresentableListener: AnyObject {
  // TODO: Declare properties and methods that the view controller can invoke to perform
  // business logic, such as signIn(). This protocol is implemented by the corresponding
  // interactor class.
}

final class FinanceHomeViewController: UIViewController, FinanceHomePresentable, FinanceHomeViewControllable {
  
  weak var listener: FinanceHomePresentableListener?
  
  private let stackView: UIStackView = {
    let stackView = UIStackView()
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.distribution = .equalSpacing
    stackView.alignment = .fill
    stackView.spacing = 4
    
    return stackView
  }()
  
  init() {
    super.init(nibName: nil, bundle: nil)
    
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    
    setupViews()
  }
  
  func setupViews() {
    title = "슈퍼페이"
    tabBarItem = UITabBarItem(title: "슈퍼페이", image: UIImage(systemName: "creditcard"), selectedImage: UIImage(systemName: "creditcard.fill"))
    
    view.backgroundColor = .white
    view.addSubview(stackView)
    
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    ])
  }
  
  func addDashboard(_ view: ViewControllable) {
    let vc = view.uiviewController
    
    addChild(vc)
    stackView.addArrangedSubview(vc.view)
    vc.didMove(toParent: self)
  }
}
