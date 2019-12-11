//
//  DetailBookPresenter.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

class DetailBookPresenter: DetailBookPresenterProtocol {
  weak var viewController: DetailBookViewControllerProtocol?
  
  func display(book: BookModel) {
    self.viewController?.display(book: book)
  }
}
