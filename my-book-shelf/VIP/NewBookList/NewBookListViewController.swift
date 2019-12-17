//
//  NewBookListViewController.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

import SnapKit
import Then

class NewBookListViewController: BaseViewController {
  var interactor: NewBookListInteractorProtocol?
  var router: NewBookListRouterProtocol?
  
  private var books: [BookModel] = []
  
  private let newBookListView = NewBookListView().then {
    $0.tableView.register(cellType: BookListItemCell.self)
  }
  
  private let activityIndicator = BaseActivityIndicator()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(self.newBookListView)
    self.view.addSubview(self.activityIndicator)
    
    self.initNavigagation()
    self.initTableView()
    self.interactor?.getBookList()
  }
  
  override func setupInitalConstraints() {
    self.newBookListView.snp.makeConstraints { (make) in
      make.edges.equalToSuperview()
    }
    
    self.activityIndicator.snp.makeConstraints { (make) in
      make.center.equalToSuperview()
    }
  }
  
  private func initNavigagation() {
    self.title = "New"
  }
  
  private func initTableView() {
    self.newBookListView.tableView.delegate = self
    self.newBookListView.tableView.dataSource = self
  }
}

extension NewBookListViewController: NewBookListViewControllerProtocol {
  func display(books: [BookModel]) {
    self.books = books
    self.activityIndicator.stopAnimating()
    self.newBookListView.tableView.reloadData()
  }
  
  func display(error: Error) {
    
  }
}

extension NewBookListViewController: UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.books.count
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: BookListItemCell = tableView.dequeueReusableCell(for: indexPath)
    cell.configure(with: self.books[indexPath.row])
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.router?.pushDeatilViewController(with: self.books[indexPath.row], view: self)
  }
}
