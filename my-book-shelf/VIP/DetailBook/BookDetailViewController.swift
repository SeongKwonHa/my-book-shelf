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
  
  private let bookDetailView = BookDetailView()
  
  private let activityIndicator = BaseActivityIndicator()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.edgesForExtendedLayout = UIRectEdge.bottom
    self.view.addSubview(self.bookDetailView)
    self.view.addSubview(self.activityIndicator)
    
    self.initNavigagation()
    self.initTextViee()
    
    self.interactor?.getDetialBookInfo()
    self.interactor?.getMemo()
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
  
  private func initTextViee() {
    self.bookDetailView.memoView.delegate = self
  }
}

extension BookDetailViewController: BookDetailViewControllerProtocol {
  func display(book: BookModel) {
    self.activityIndicator.stopAnimating()
    self.bookDetailView.configure(book: book)
  }
  
  func display(memo: String) {
    self.bookDetailView.configure(memo: memo)
  }
  
  func display(error: Error) {
    
  }
}

extension BookDetailViewController: UITextViewDelegate {
  func textViewDidEndEditing(_ textView: UITextView) {
    self.interactor?.updateMemo(with: textView.text)
  }
}
