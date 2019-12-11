//
//  BaseActivityIndicator.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/12.
//  Copyright © 2019 Jam. All rights reserved.
//

import SnapKit

class BaseActivityIndicator: UIActivityIndicatorView {
  override init(style: UIActivityIndicatorView.Style) {
    super.init(style: style)
    initialize()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    initialize()
  }

  required init(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  func initialize() {
    self.hidesWhenStopped = true
    self.style = .large
    self.color = .darkGray
    self.startAnimating()
    
    self.snp.makeConstraints { (make) in
      make.width.equalTo(50)
      make.height.equalTo(50)
    }
  }
}

