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
      .subscribe (onNext: { (books) in
        guard let books = books else { return }
        self.presenter?.display(books: books)
      }).disposed(by: self.disposeBag)
    
  }
}
