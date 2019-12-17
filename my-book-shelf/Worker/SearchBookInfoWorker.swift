//
//  SearchBookInfoWorker.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/16.
//  Copyright © 2019 Jam. All rights reserved.
//

import Alamofire
import ObjectMapper
import RxSwift
import SwiftyJSON

struct SearchBookInfoWorker {
  static func getSearchData(with text: String, page: String) -> Observable<[BookModel]?> {
    guard let url = URL(string: EndPoints.SearchBook(text, page).url) else {
      return .error(CustomError.endPointUrlNotFound)
    }
    
    return Observable.create { (subscriber) -> Disposable in
      let req = Alamofire
        .request(url, method: .get, encoding: JSONEncoding.default, headers: [:])
        .validate(statusCode: 200..<300)
        .responseJSON { response in
          switch response.result {
          case .success(let data):
            let json = JSON(data)
            guard let books: [BookModel] = Mapper<BookModel>()
              .mapArray(JSONObject: json["books"].object) else {
                subscriber.onError(CustomError.objectNotFound)
                return
            }
            subscriber.onNext(books)
            subscriber.onCompleted()
          case .failure(let error):
            subscriber.onError(CustomError.serverError(error))
          }
        }
      
      return Disposables.create {
        req.cancel()
      }
    }
  }
}
