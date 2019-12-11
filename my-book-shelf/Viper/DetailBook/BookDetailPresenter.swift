//
//  BookDetailPresenter.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

class BookDetailPresenter: BookDetailPresenterProtocol {
  weak var viewController: BookDetailViewControllerProtocol?
  
  func display(book: BookModel) {
    self.viewController?.display(book: book)
  }
}
