//
//  EndPoints.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

import Foundation

struct API {
  static let baseURl = "https://api.itbook.store/1.0"
}

enum EndPoints {
  case GetNewBookList
  case SearchBook(String, String)
  case GetBookDetail(String)
  
  var path: String {
    switch self {
    case .GetNewBookList:
      return "/new"
    case .SearchBook(let query, let page):
      return "/search/\(query)/\(page)"
    case .GetBookDetail(let isbn13):
      return "/books/\(isbn13)"
    }
  }
  
  var url: String {
    return "\(API.baseURl)\(path)"
  }
}
