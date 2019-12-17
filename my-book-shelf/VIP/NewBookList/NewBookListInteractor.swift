//
//  NewBookListInteractor.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

import RxSwift

class NewBookListInteractor: NewBookListInteractorProtocol {
  var presenter: NewBookListPresenterProtocol?
  
  private let disposeBag = DisposeBag()
  
  func getBookList() {
    BookModel
      .getNewBookList()
      .observeOn(MainScheduler.instance)
      .subscribe (onNext: { [weak self] (books) in
        guard let books = books else { return }
        self?.presenter?.display(books: books)
      }, onError: { [weak self] error in
        self?.presenter?.display(error: error)
      }).disposed(by: self.disposeBag)
  }
}
