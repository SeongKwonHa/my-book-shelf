//
//  NewBookListViewController.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

import Then

class NewBookListViewController: BaseViewController {
  var interactor: NewBookListInteractorProtocol?
  var router: NewBookListRouterProtocol?
  
  private var books: [BookModel] = [BookModel()]
  
  private let newBookListView = NewBookListView().then {
    $0.tableView.register(cellType: BookListItemCell.self)
  }
  
  override func loadView() {
    self.view = self.newBookListView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.initTableView()
    self.interactor?.getBookList()
  }
  
  private func initTableView() {
    self.newBookListView.tableView.delegate = self
    self.newBookListView.tableView.dataSource = self
  }
}

extension NewBookListViewController: NewBookListViewControllerProtocol {
  func display(books: [BookModel]) {
    self.books = books
    self.newBookListView.tableView.reloadData()
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
}
