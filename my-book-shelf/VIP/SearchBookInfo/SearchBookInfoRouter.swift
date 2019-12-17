//
//  SearchBookInfoRouter.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

import UIKit

class SearchBookInfoRouter: SearchBookInfoRouterProtocol {
  static func createModule() -> SearchBookInfoViewController {
    let viewController = SearchBookInfoViewController()
    let presenter = SearchBookInfoPresenter()
    let interactor = SearchBookInfoInteractor()
    let router = SearchBookInfoRouter()
    
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    return viewController
  }
  
  func pushDeatilViewController(with book: BookModel, view: UIViewController?) {
    let bookDetailView = BookDetailRouter.createModule(book: book)
    view?.navigationController?.pushViewController(bookDetailView, animated: true)
  }
}
