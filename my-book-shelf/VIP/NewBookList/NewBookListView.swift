//
//  NewBookListView.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/08.
//  Copyright © 2019 Jam. All rights reserved.
//

import SnapKit
import Then

class NewBookListView: BaseView {
  let tableView = UITableView(frame: CGRect.zero, style: .plain).then {
    $0.separatorStyle = .none
  }
  
  override func initialize() {
    super.initialize()
    
    self.addSubview(self.tableView)
  }
  
  override func setLayouts() {
    super.setLayouts()
    
    self.tableView.snp.makeConstraints { (make) in
      make.edges.equalToSuperview()
    }
  }
}

