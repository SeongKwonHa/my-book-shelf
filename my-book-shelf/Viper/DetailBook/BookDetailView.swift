//
//  BookDetailView.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

import SnapKit
import Then

class BookDetailView: BaseView {
  let testView = UIView()
  
  override func initialize() {
    super.initialize()
    
    self.addSubview(self.testView)
  }
  
  override func setLayouts() {
    super.setLayouts()
    
    self.testView.snp.makeConstraints { (make) in
      make.edges.equalToSuperview()
    }
  }
  
  func configure() {
    
  }
}
