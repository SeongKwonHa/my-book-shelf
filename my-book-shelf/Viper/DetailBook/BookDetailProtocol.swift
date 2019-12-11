//
//  BookDetailProtocol.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

protocol BookDetailViewControllerProtocol: class {
  var interactor: BookDetailInteractorProtocol? { get set }
  var router: BookDetailRouterProtocol? { get set }
  
  func display(book: BookModel)
}

protocol BookDetailPresenterProtocol: class {
  var viewController: BookDetailViewControllerProtocol? { get set }
  
  func display(book: BookModel)
}

protocol BookDetailInteractorProtocol: class {
  var presenter: BookDetailPresenterProtocol? { get set }
  
  func getDetialBookInfo(isbn13: String)
}

protocol BookDetailRouterProtocol: class {
  static func createModule(book: BookModel) -> BookDetailViewController
}
