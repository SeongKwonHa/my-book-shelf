//
//  DetailBookProtocol.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

protocol DetailBookViewControllerProtocol: class {
  var interactor: DetailBookInteractorProtocol? { get set }
  var router: DetailBookRouterProtocol? { get set }
  
  func display(book: BookModel)
}

protocol DetailBookPresenterProtocol: class {
  var viewController: DetailBookViewControllerProtocol? { get set }
  
  func display(book: BookModel)
}

protocol DetailBookInteractorProtocol: class {
  var presenter: DetailBookPresenterProtocol? { get set }
  
  func getDetialBookInfo(isbn13: String)
}

protocol DetailBookRouterProtocol: class {
  static func createModule(book: BookModel) -> DetailBookViewController
}
