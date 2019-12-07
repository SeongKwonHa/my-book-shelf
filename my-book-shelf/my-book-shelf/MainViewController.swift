//
//  MainViewController.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

import SnapKit
import Then

final class MainViewController: BaseViewController {
  let splashView = SplashView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.addSubview(self.splashView)
    
    self.hideSplashView(delay: 2.0) {
      self.presentNewBookListView()
    }
  }
  
  override func setupInitalConstraints() {
    self.splashView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
  private func hideSplashView(delay: Double, completion: @escaping () -> ()) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {
      completion()
    }
  }
  
  private func presentNewBookListView() {
    let vc = NewBookListView()
    vc.modalPresentationStyle = .fullScreen
    vc.modalTransitionStyle = .crossDissolve
    self.present(vc, animated: true, completion: nil)
  }
}

