//
//  BaseTabBarItem.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

import UIKit

class BaseTabBarItem: UITabBarItem {
  private let normalTitleFont = UIFont.systemFont(ofSize: 12)
  private let selectedTitleFont = UIFont.boldSystemFont(ofSize: 12)

  private let normalTitleColor = UIColor.gray
  private let selectedTitleColor = UIColor.black
  
  override init() {
    super.init()
    self.initialize()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.initialize()
  }
  
  func initialize() {
    self.setTitleTextAttributes(
      [.font: selectedTitleFont, .foregroundColor: selectedTitleColor],
      for: .selected)
    self.setTitleTextAttributes(
      [.font: normalTitleFont, .foregroundColor: normalTitleColor],
      for: .normal)
  }
}
