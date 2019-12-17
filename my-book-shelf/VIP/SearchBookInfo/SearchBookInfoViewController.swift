//
//  SearchBookInfoViewController.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/16.
//  Copyright © 2019 Jam. All rights reserved.
//

import SnapKit
import Then

class SearchBookInfoViewController: BaseViewController {
  var interactor: SearchBookInfoInteractorProtocol?
  var router: SearchBookInfoRouterProtocol?
  
  private var books: [BookModel] = []
  
  private let searchBookInfoView = SearchBookInfoView().then {
    $0.tableView.register(cellType: BookListItemCell.self)
  }
  
  private let activityIndicator = BaseActivityIndicator().then {
    $0.stopAnimating()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(self.searchBookInfoView)
    self.view.addSubview(self.activityIndicator)
    
    self.initNavigagation()
    self.initTableView()
    self.initSearchBar()
  }
  
  override func setupInitalConstraints() {
    self.searchBookInfoView.snp.makeConstraints { (make) in
      make.edges.equalToSuperview()
    }
    
    self.activityIndicator.snp.makeConstraints { (make) in
      make.center.equalTo(self.searchBookInfoView.snp.center)
    }
  }
  
  private func initNavigagation() {
    self.title = "Search"
  }
  
  private func initTableView() {
    self.searchBookInfoView.tableView.delegate = self
    self.searchBookInfoView.tableView.dataSource = self
  }
  
  private func initSearchBar() {
    self.searchBookInfoView.searchBar.delegate = self
  }
}

extension SearchBookInfoViewController: SearchBookInfoViewControllerProtocol {
  func display(books: [BookModel]) {
    self.books += books
    self.activityIndicator.stopAnimating()
    self.searchBookInfoView.tableView.reloadData()
  }
  
  func display(error: Error) {
    
  }
}

extension SearchBookInfoViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard
      let keyword = searchBar.text,
      keyword.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
      return
    }
    self.books = []
    self.searchBookInfoView.tableView.reloadData()
    self.activityIndicator.startAnimating()
    self.interactor?.getSearchInfoIfNeeded(with: keyword)
    
  }
}

extension SearchBookInfoViewController: UITableViewDelegate, UITableViewDataSource {
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
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let yOffset = scrollView.contentOffset.y
    let trigger = scrollView.contentSize.height - scrollView.frame.size.height
    if yOffset > trigger {
      self.interactor?.fetchMore()
    }
  }

  func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    self.searchBookInfoView.searchBar.resignFirstResponder()
  }
}
