//
//  SearchBookInfoView.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

import SnapKit
import Then

class SearchBookInfoView: BaseView {
  let searchBar = BaseSearchBar(frame: CGRect.zero)
  let tableView = UITableView(frame: CGRect.zero, style: .plain).then {
      $0.separatorStyle = .none
  }
    
  override func initialize() {
    super.initialize()
    self.addSubview(self.searchBar)
    self.addSubview(self.tableView)
  }
  
  override func setLayouts() {
    super.setLayouts()
    
    self.searchBar.snp.makeConstraints { (make) in
      make.top.equalToSuperview()
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
    }
    
    self.tableView.snp.makeConstraints { (make) in
      make.top.equalTo(self.searchBar.snp.bottom)
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
      make.bottom.equalToSuperview()
    }
  }
}
