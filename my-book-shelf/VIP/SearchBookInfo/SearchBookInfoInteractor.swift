//
//  SearchBookInfoInteractor.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

import RxSwift

class SearchBookInfoInteractor: SearchBookInfoInteractorProtocol {
  var presenter: SearchBookInfoPresenterProtocol?
  
  private var cache: InMemoryCacheDataStore = InMemoryCacheDataStore()
  
  private var page = 1
  private var currentKeyword = ""
  private var isFetchingNextPage = false
  
  private let disposeBag = DisposeBag()
  
  func getSearchInfoIfNeeded(with keyword: String) {
    guard !isFetchingNextPage else { return }
    
    self.page = 1
    self.currentKeyword = keyword
    self.getSearchInfo(with: keyword, page: self.page)
  }
  
  func fetchMore() {
    guard !isFetchingNextPage else { return }
    
    self.page += 1
    self.getSearchInfo(with: self.currentKeyword, page: self.page)
  }
  
  private func getSearchInfo(with keyword: String, page: Int) {
    let page = String(page)
    let cacheKey = self.makeCacheKey(with: keyword, page: page)
    self.isFetchingNextPage = true
    
    if let books = self.cache.find(key: cacheKey) as? [BookModel] {
      self.presenter?.display(books: books)
      self.isFetchingNextPage = false
      return
    }
    
    BookModel
      .getSearchData(with: keyword, page: page)
      .observeOn(MainScheduler.instance)
      .subscribe (onNext: { [weak self] (books) in
        guard let books = books else { return }
        self?.cache.add(key: cacheKey, value: books)
        self?.presenter?.display(books: books)
        self?.isFetchingNextPage = false
      }, onError: { [weak self] error in
        self?.presenter?.display(error: error)
        self?.isFetchingNextPage = false
      }).disposed(by: self.disposeBag)
  }
  
  private func makeCacheKey(with keyword: String, page: String) -> String {
    return keyword + "//" + page
  }
}
