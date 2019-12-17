//
//  BaseSearchBar.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/16.
//  Copyright © 2019 Jam. All rights reserved.
//

import UIKit

class BaseSearchBar: UISearchBar {
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setup()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    self.setup()
  }

  private func setup() {
    self.searchBarStyle = .minimal
    self.placeholder = "검색어를 입력해주세요."

    UIBarButtonItem
      .appearance(whenContainedInInstancesOf: [UISearchBar.self])
      .setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
  }
}
