//
//  NewBookListProtocol.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/07.
//  Copyright © 2019 Jam. All rights reserved.
//

protocol NewBookListViewProtocol: class {
  var presenter: NewBookListPresenterProtocol? { get set }
}

protocol NewBookListPresenterProtocol: class {
  var view: NewBookListViewProtocol? { get set }
  var interactor: NewBookListInteractorProtocol? { get set }
  var router: NewBookListRouterProtocol? { get set }
}

protocol NewBookListInteractorProtocol: class {
  var presenter: NewBookListPresenterProtocol? { get set }
}

protocol NewBookListRouterProtocol: class {
  func createModule() -> NewBookListView
}
