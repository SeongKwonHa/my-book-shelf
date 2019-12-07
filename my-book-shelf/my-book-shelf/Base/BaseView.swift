//
//  BaseView.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

import UIKit

class BaseView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.initialize()
    self.setLayouts()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.initialize()
    self.setLayouts()
  }

  func initialize() {
  }

  func setLayouts() {
  }
}
