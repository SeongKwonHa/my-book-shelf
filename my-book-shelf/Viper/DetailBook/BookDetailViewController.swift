//
//  BookDetailViewController.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/12.
//  Copyright © 2019 Jam. All rights reserved.
//

import SnapKit
import Then

class BookDetailViewController: BaseViewController {
  var interactor: BookDetailInteractorProtocol?
  var router: BookDetailRouterProtocol?
  
  private var book: BookModel?
  
  private let bookDetailView = BookDetailView()
  
  private let activityIndicator = BaseActivityIndicator()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(self.bookDetailView)
    self.view.addSubview(self.activityIndicator)
    
    self.initNavigagation()
  }
  
  override func setupInitalConstraints() {
    self.bookDetailView.snp.makeConstraints { (make) in
      make.edges.equalToSuperview()
    }
    
    self.activityIndicator.snp.makeConstraints { (make) in
      make.center.equalToSuperview()
    }
  }
  
  private func initNavigagation() {
    self.title = "Book Detail"
  }
}

extension BookDetailViewController: BookDetailViewControllerProtocol {
  func display(book: BookModel) {
    self.book = book
    self.activityIndicator.stopAnimating()
    self.bookDetailView.configure()
  }
}

