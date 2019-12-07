//
//  NewBookListView.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

import SnapKit
import Then

class NewBookListView: BaseViewController, NewBookListViewProtocol {
  let testView = UIView().then {
    $0.backgroundColor = .yellow
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(testView)
    
    self.testView.snp.makeConstraints { (make) in
      make.edges.equalToSuperview()
    }
  }
}
