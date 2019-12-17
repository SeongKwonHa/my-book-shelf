//
//  BaseViewController.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
  private var didSetupInitalConstraints = false
  
  init() {
    super.init(nibName: nil, bundle: nil)
  }

  required convenience init?(coder aDecoder: NSCoder) {
    self.init()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.edgesForExtendedLayout =  UIRectEdge.init(rawValue: 0)
    self.view.backgroundColor = .white
    self.view.setNeedsUpdateConstraints() // call updateViewConstraints
  }

  override func updateViewConstraints() {
    if !self.didSetupInitalConstraints {
      self.setupInitalConstraints()
      self.didSetupInitalConstraints = true
    }
    
    super.updateViewConstraints()
  }

  func setupInitalConstraints() {
  }
}
