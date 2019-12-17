//
//  SearchBookInfoProtocol.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

import UIKit

protocol SearchBookInfoViewControllerProtocol: class {
  var interactor: SearchBookInfoInteractorProtocol? { get set }
  var router: SearchBookInfoRouterProtocol? { get set }
  
  func display(books: [BookModel])
  func display(error: Error)
}

protocol SearchBookInfoPresenterProtocol: class {
  var viewController: SearchBookInfoViewControllerProtocol? { get set }
  
  func display(books: [BookModel])
  func display(error: Error)
}

protocol SearchBookInfoInteractorProtocol: class {
  var presenter: SearchBookInfoPresenterProtocol? { get set }
  
  func getSearchInfoIfNeeded(with keyword: String)
  func fetchMore()
}

protocol SearchBookInfoRouterProtocol: class {
  static func createModule() -> SearchBookInfoViewController
  func pushDeatilViewController(with book: BookModel, view: UIViewController?)
}
