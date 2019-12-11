//
//  BaseTabBarController.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
  init() {
    super.init(nibName: nil, bundle: nil)
    self.initialize()
  }

  required convenience init?(coder aDecoder: NSCoder) {
    self.init()
    self.initialize()
  }
  
  func initialize() {
    self.modalPresentationStyle = .fullScreen
    self.modalTransitionStyle = .crossDissolve
  }
}
