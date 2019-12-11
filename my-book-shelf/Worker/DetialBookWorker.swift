//
//  DetialBookWorker.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/12.
//  Copyright © 2019 Jam. All rights reserved.
//

import Alamofire
import ObjectMapper
import RxSwift
import SwiftyJSON

struct DetailBookWorker {
  static func getDetailBookInfo(isbn13: String) -> Observable<BookModel?> {
    guard let url = URL(string: EndPoints.GetBookDetail(isbn13).url) else {
      return .error(CustomErrors.endPointUrlNotFound)
    }
    
    return Observable.create { (subscriber) -> Disposable in
      let req = Alamofire.request(url, method: .get, encoding: JSONEncoding.default, headers: [:])
      .validate(statusCode: 200..<300)
      .responseJSON{ response in
        switch response.result {
        case .success(let data):
          let json = JSON(data)
          guard let book: BookModel = Mapper<BookModel>().map(JSONObject: json["book"].object) else {
            subscriber.onError(CustomErrors.objectNotFound)
            return
          }
          subscriber.onNext(book)
          subscriber.onCompleted()
        case .failure(let error):
          subscriber.onError(CustomErrors.serverError(error))
        }
      }
      
      return Disposables.create {
        req.cancel()
      }
    }
  }
}

