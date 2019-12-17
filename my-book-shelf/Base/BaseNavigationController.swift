//
//  BaseNavigationController.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/12.
//  Copyright © 2019 Jam. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    self.initialize()
  }

  override init(rootViewController: UIViewController) {
    super.init(rootViewController: rootViewController)
    self.initialize()
  }

  override init(navigationBarClass: AnyClass?, toolbarClass: AnyClass?) {
    super.init(navigationBarClass: navigationBarClass, toolbarClass: toolbarClass)
    self.initialize()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.initialize()
  }

  func initialize() {
    self.view.backgroundColor = .white
  }
}
