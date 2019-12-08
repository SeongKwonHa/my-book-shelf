//
//  BaseTableViewCell.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/08.
//  Copyright © 2019 Jam. All rights reserved.
//

import Reusable
import SnapKit

class BaseTableViewCell: UITableViewCell, Reusable {
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
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

