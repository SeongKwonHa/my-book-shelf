//
//  CustomError.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

enum CustomError: Error {
  case objectNotFound
  case endPointUrlNotFound
  case serverError(Error)
}
