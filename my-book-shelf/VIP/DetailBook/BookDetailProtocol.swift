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
  func display(memo: String)
  func display(error: Error)
}

protocol BookDetailPresenterProtocol: class {
  var viewController: BookDetailViewControllerProtocol? { get set }
  
  func display(book: BookModel)
  func display(memo: String)
  func display(error: Error)
}

protocol BookDetailInteractorProtocol: class {
  var presenter: BookDetailPresenterProtocol? { get set }
  
  func getDetialBookInfo()
  func getMemo()
  func updateMemo(with text: String)
}

protocol BookDetailRouterProtocol: class {
  static func createModule(book: BookModel) -> BookDetailViewController
}
