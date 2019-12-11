//
//  BookListItemCell.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/08.
//  Copyright © 2019 Jam. All rights reserved.
//

import SnapKit
import SDWebImage

class BookListItemCell: BaseTableViewCell {
  private struct Constants {
    static let thumbImageSide = 60
    static let containerTop = 10
    static let containerBottom = 10
    static let containerLeading = 10
    static let containerTrailing = 20
    static let priceLabelCompressPriority = Float(1000)
  }
  
  private var containerView = UIStackView().then {
    $0.axis = .horizontal
    $0.alignment = .center
    $0.spacing = 10
  }
  
  private var thumbView = UIImageView().then {
    $0.contentMode = .scaleAspectFill
  }
  
  private var middleStackView = UIStackView().then {
    $0.axis = .vertical
    $0.alignment = .leading
    $0.spacing = 5
  }
  
  private var titleLabel = UILabel().then {
    $0.font = UIFont.boldSystemFont(ofSize: 14)
    $0.textColor = .black
    $0.text = "title"
  }
  
  private var subTitleLabel = UILabel().then {
    $0.font = UIFont.systemFont(ofSize: 12)
    $0.textColor = .gray
    $0.text = "subtitle"
    $0.numberOfLines = 2
  }
  
  private var priceLabel = UILabel().then {
    $0.font = UIFont.systemFont(ofSize: 10)
    $0.textColor = .red
    $0.text = "price"
  }
  
  override func initialize() {
    super.initialize()
    
    self.contentView.addSubview(self.containerView)
    
    self.containerView.addArrangedSubview(self.thumbView)
    self.containerView.addArrangedSubview(self.middleStackView)
    self.containerView.addArrangedSubview(self.priceLabel)
    
    self.middleStackView.addArrangedSubview(self.titleLabel)
    self.middleStackView.addArrangedSubview(self.subTitleLabel)
    
    self.priceLabel.setContentCompressionResistancePriority(
      UILayoutPriority(rawValue: Constants.priceLabelCompressPriority),
      for: .horizontal
    )
    
    self.selectionStyle = .none
  }
  
  override func setLayouts() {
    super.setLayouts()
    
    self.containerView.snp.makeConstraints { (make) in
      make.leading.equalToSuperview().inset(Constants.containerTop)
      make.top.equalToSuperview().inset(Constants.containerBottom)
      make.bottom.equalToSuperview().inset(Constants.containerLeading)
      make.trailing.equalToSuperview().inset(Constants.containerTrailing)
    }
    
    self.thumbView.snp.makeConstraints { (make) in
      make.width.equalTo(Constants.thumbImageSide)
      make.height.equalTo(Constants.thumbImageSide)
    }
  }
  
  func configure(with model: BookModel) {
    self.titleLabel.text = model.title
    self.subTitleLabel.text = model.subTitle
    self.priceLabel.text = model.price
    self.thumbView.sd_setImage(with: URL(string: model.imageUrl))
  }
}
