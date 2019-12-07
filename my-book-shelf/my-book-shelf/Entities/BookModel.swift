//
//  BookModel.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

import ObjectMapper

struct BookModel {
  var isbn13: String = ""
  var title: String = ""
  var subTitle: String = ""
  var price: String = ""
  var imageUrl: String = ""
  var url: String = ""
  
  // get on only detail
  var authors: String = ""
  var publisher: String = ""
  var isbn10: String = ""
  var pages: String = ""
  var year: String = ""
  var rating: String = ""
  var desc: String = ""
  var pdf: [String: String] = [:]
}

extension BookModel: Mappable {
  init?(map: Map) {
  }
  
  mutating func mapping(map: Map) {
    isbn13      <- map["isbn13"]
    title       <- map["title"]
    subTitle    <- map["subTitle"]
    price       <- map["price"]
    imageUrl    <- map["iamge"]
    url         <- map["url"]
    authors     <- map["authors"]
    publisher   <- map["publisher"]
    isbn10      <- map["isbn10"]
    pages       <- map["pages"]
    year        <- map["year"]
    rating      <- map["rating"]
    desc        <- map["desc"]
    pdf         <- map["pdf"]
  }
}
