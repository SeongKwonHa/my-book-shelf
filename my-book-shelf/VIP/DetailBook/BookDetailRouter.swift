//
//  BookDetailRouter.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

class BookDetailRouter: BookDetailRouterProtocol {
  static func createModule(book: BookModel) -> BookDetailViewController {
    let viewController = BookDetailViewController()
    let presenter = BookDetailPresenter()
    let interactor = BookDetailInteractor()
    let router = BookDetailRouter()
    
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    interactor.book = book
    presenter.viewController = viewController
    return viewController
  }
}
