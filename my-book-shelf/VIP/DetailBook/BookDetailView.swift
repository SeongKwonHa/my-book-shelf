//
//  BookDetailView.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

import SnapKit
import Then

class BookDetailView: BaseView {
  private struct Constants {
    static let thumbImageSide = 60
    static let containerTop = 10
    static let containerBottom = 10
    static let containerLeading = 10
    static let containerTrailing = 20
  }
  
  private let scrollView = UIScrollView().then {
    $0.showsHorizontalScrollIndicator = false
  }
  private let containerView = UIStackView().then {
    $0.axis = .vertical
    $0.alignment = .leading
  }

  private let titleLabel = UILabel()
  private let subTitleLabel = UILabel()
  private let priceLabbel = UILabel()
  private let imageContainerView = UIView()
  private var thumbView = UIImageView().then {
    $0.contentMode = .scaleAspectFit
  }
  private let authorsLabbel = UILabel()
  private let publisherLabbel = UILabel()
  private let pagesLabbel = UILabel()
  private let yearLabbel = UILabel()
  private let descLabbel = UILabel()
  private let ratingLabbel = UILabel()
  
  private let memoLabbel = UILabel().then {
    $0.isHidden = true
    $0.text = "Memo"
    $0.font = UIFont.boldSystemFont(ofSize: 17)
  }
  
  let memoView = UITextView().then {
    $0.isHidden = true
    $0.backgroundColor = .lightGray
    $0.font = UIFont.systemFont(ofSize: 16)
  }

  override func initialize() {
    super.initialize()

    self.addSubview(self.containerView)
    self.containerView.addArrangedSubview(self.titleLabel)
    self.containerView.addArrangedSubview(self.subTitleLabel)
    self.containerView.addArrangedSubview(self.priceLabbel)
    self.containerView.addArrangedSubview(self.thumbView)
    self.containerView.addArrangedSubview(self.authorsLabbel)
    self.containerView.addArrangedSubview(self.publisherLabbel)
    self.containerView.addArrangedSubview(self.pagesLabbel)
    self.containerView.addArrangedSubview(self.yearLabbel)
    self.containerView.addArrangedSubview(self.descLabbel)
    self.containerView.addArrangedSubview(self.ratingLabbel)
    self.containerView.addArrangedSubview(self.memoLabbel)
    
    self.addSubview(self.memoView)
  }

  override func setLayouts() {
    super.setLayouts()
    
    self.thumbView.snp.makeConstraints { (make) in
      make.width.equalTo(Constants.thumbImageSide)
      make.height.equalTo(Constants.thumbImageSide)
    }

    self.containerView.snp.makeConstraints { (make) in
      make.leading.equalToSuperview().inset(Constants.containerTop)
      make.top.equalToSuperview().inset(Constants.containerBottom)
      make.trailing.equalToSuperview().inset(Constants.containerTrailing)
    }
    
    self.memoView.snp.makeConstraints { (make) in
      make.top.equalTo(self.containerView.snp.bottom)
      make.bottom.equalToSuperview().inset(Constants.containerBottom)
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
    }
  }

  func configure(book: BookModel) {
    self.titleLabel.text = "Title: " + book.title
    self.subTitleLabel.text = "SubTitle: " + book.subTitle
    self.priceLabbel.text = "Price: " + book.price
    self.authorsLabbel.text = "Auth: " + book.authors
    self.thumbView.sd_setImage(with: URL(string: book.imageUrl))
    self.publisherLabbel.text = "Publisher: " + book.publisher
    self.pagesLabbel.text = "Pages: " + book.pages
    self.yearLabbel.text = "Year: " + book.year
    self.descLabbel.text = "Description: " + book.desc
    self.ratingLabbel.text = "Rating: " + book.rating
    self.memoLabbel.isHidden = false
    self.memoView.isHidden = false
  }
  
  func configure(memo: String) {
    self.memoView.isHidden = false
    self.memoView.text = memo
  }
}
