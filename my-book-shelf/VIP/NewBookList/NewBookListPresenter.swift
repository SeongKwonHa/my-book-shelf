//
//  NewBookListPresenter.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

class NewBookListPresenter: NewBookListPresenterProtocol {
  weak var viewController: NewBookListViewControllerProtocol?
  
  func display(books: [BookModel]) {
    self.viewController?.display(books: books)
  }
  
  func display(error: Error) {
    self.viewController?.display(error: error)
  }
}
