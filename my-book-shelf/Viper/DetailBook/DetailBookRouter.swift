//
//  DetailBookRouter.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

class DetailBookRouter: DetailBookRouterProtocol {
  static func createModule(book: BookModel) -> DetailBookViewController {
    let viewController = DetailBookViewController()
    let presenter = DetailBookPresenter()
    let interactor = DetailBookInteractor()
    let router = DetailBookRouter()
    
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    return viewController
  }
}
