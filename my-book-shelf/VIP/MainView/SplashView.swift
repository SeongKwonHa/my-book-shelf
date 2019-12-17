//
//  SplashView.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

import SnapKit
import Then

final class SplashView: BaseView {
  let containerView = UIView().then {
    $0.backgroundColor = .white
  }
  
  let titleLabel = UILabel().then {
    $0.font = UIFont.boldSystemFont(ofSize: 17)
    $0.text = "My BookShelf"
  }
  
  override func initialize() {
    super.initialize()
    
    self.addSubview(self.containerView)
    self.containerView.addSubview(self.titleLabel)
  }
  
  override func setLayouts() {
    super.setLayouts()
    
    self.containerView.snp.makeConstraints { (make) in
      make.edges.equalToSuperview()
    }
    
    self.titleLabel.snp.makeConstraints { (make) in
      make.centerX.equalToSuperview()
      make.centerY.equalToSuperview()
    }
  }
}
