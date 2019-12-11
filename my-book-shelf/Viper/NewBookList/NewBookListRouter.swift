//
//  NewBookListRouter.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

import UIKit

class NewBookListRouter: NewBookListRouterProtocol {
  static func createModule() -> NewBookListViewController {
    let viewController = NewBookListViewController()
    let presenter = NewBookListPresenter()
    let interactor = NewBookListInteractor()
    let router = NewBookListRouter()
    
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    return viewController
  }
  
  func pushDeatilViewController(with book: BookModel, view: UIViewController?) {
    let detailBookView = BookDetailRouter.createModule(book: book)
    view?.navigationController?.pushViewController(detailBookView, animated: true)
  }
}
