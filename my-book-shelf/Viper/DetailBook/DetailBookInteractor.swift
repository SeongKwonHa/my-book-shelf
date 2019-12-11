//
//  DetailBookInteractor.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

import RxSwift

class DetailBookInteractor: DetailBookInteractorProtocol {
  var presenter: DetailBookPresenterProtocol?
  
  private let disposeBag = DisposeBag()
  
  func getDetialBookInfo(isbn13: String) {
    BookModel
      .getDetailBookInfo(isbn13: isbn13)
      .observeOn(MainScheduler.instance)
      .subscribe (onNext: { (book) in
        guard let book = book else { return }
        self.presenter?.display(book: book)
      }).disposed(by: self.disposeBag)
  }
}
