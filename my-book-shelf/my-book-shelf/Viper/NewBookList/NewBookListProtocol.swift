//
//  NewBookListProtocol.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

protocol NewBookListViewControllerProtocol: class {
  var interactor: NewBookListInteractorProtocol? { get set }
  var router: NewBookListRouterProtocol? { get set }
  
  func display(books: [BookModel])
}

protocol NewBookListPresenterProtocol: class {
  var viewController: NewBookListViewControllerProtocol? { get set }
  
  func display(books: [BookModel])
}

protocol NewBookListInteractorProtocol: class {
  var presenter: NewBookListPresenterProtocol? { get set }
  
  func getBookList()
}

protocol NewBookListRouterProtocol: class {
  static func createModule() -> NewBookListViewController
}
