//
//  BookDetailInteractor.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

import RxSwift

class BookDetailInteractor: BookDetailInteractorProtocol {
  var presenter: BookDetailPresenterProtocol?
  
  var book: BookModel?
  
  private let store: UserDefualtDataStore = UserDefualtDataStore()
  private let disposeBag = DisposeBag()
  
  func getDetialBookInfo() {
    guard let isbn13 = self.book?.isbn13 else {
      return
    }
    
    BookModel
      .getBookDetailInfo(isbn13: isbn13)
      .observeOn(MainScheduler.instance)
      .subscribe (onNext: { [weak self] book in
        guard let book = book else { return }
        self?.presenter?.display(book: book)
      }, onError: { [weak self] error in
        self?.presenter?.display(error: error)
      }).disposed(by: self.disposeBag)
  }
  
  func getMemo() {
    guard let isbn13 = self.book?.isbn13 else { return }
    if let memo = self.store.find(key: makeCacheKey(with: isbn13)) as? String {
      self.presenter?.display(memo: memo)
    }
  }
  
  func updateMemo(with text: String) {
    guard let isbn13 = self.book?.isbn13 else { return }
    self.store.add(key: self.makeCacheKey(with: isbn13), value: text)
  }
  
  private func makeCacheKey(with isbn13: String) -> String {
    return "BookDetail" + "//" + isbn13
  }
}
