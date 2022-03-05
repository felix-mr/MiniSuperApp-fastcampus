//
//  CardOnFileDashboardBuilder.swift
//  MiniSuperApp
//
//  Created by Felix.mr on 2022/03/01.
//

import ModernRIBs

protocol CardOnFileDashboardDependency: Dependency {
  var cardOnFileRepository: CardOnFileRepository { get }
}

final class CardOnFileDashboardComponent: Component<CardOnFileDashboardDependency>, CardOnFileDashboardInteractorDependency {
  var cardOnFileRepository: CardOnFileRepository { dependency.cardOnFileRepository }
  
  // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol CardOnFileDashboardBuildable: Buildable {
  func build(withListener listener: CardOnFileDashboardListener) -> CardOnFileDashboardRouting
}

final class CardOnFileDashboardBuilder: Builder<CardOnFileDashboardDependency>, CardOnFileDashboardBuildable {
  
  override init(dependency: CardOnFileDashboardDependency) {
    super.init(dependency: dependency)
  }
  
  func build(withListener listener: CardOnFileDashboardListener) -> CardOnFileDashboardRouting {
    let component = CardOnFileDashboardComponent(dependency: dependency)
    let viewController = CardOnFileDashboardViewController()
    let interactor = CardOnFileDashboardInteractor(
      presenter: viewController,
      dependency: component
    )
    interactor.listener = listener
    return CardOnFileDashboardRouter(interactor: interactor, viewController: viewController)
  }
}
