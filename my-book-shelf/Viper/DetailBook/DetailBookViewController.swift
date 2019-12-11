//
//  DetailBookViewController.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/12.
//  Copyright © 2019 Jam. All rights reserved.
//

import SnapKit
import Then

class DetailBookViewController: BaseViewController {
  var interactor: DetailBookInteractorProtocol?
  var router: DetailBookRouterProtocol?
  
  private var book: BookModel?
  
  private let detailBookView = DetailBookView()
  
  private let activityIndicator = BaseActivityIndicator()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(self.detailBookView)
    self.view.addSubview(self.activityIndicator)
    
    self.initNavigagation()
  }
  
  override func setupInitalConstraints() {
    self.detailBookView.snp.makeConstraints { (make) in
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

extension DetailBookViewController: DetailBookViewControllerProtocol {
  func display(book: BookModel) {
    self.book = book
    self.activityIndicator.stopAnimating()
    self.detailBookView.configure()
  }
}

