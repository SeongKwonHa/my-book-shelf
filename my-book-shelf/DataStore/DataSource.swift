//
//  DataStore.swift
//  my-book-shelf
//
//  Created by Jam on 2019/12/17.
//  Copyright © 2019 Jam. All rights reserved.
//

import Foundation

protocol Storeable {
  func add(key: String, value: Any)
  func delete(key: String)
  func find(key: String) -> Any?
  func update(key: String, value: Any)
  func removeAll()
}

class InMemoryCacheDataStore: Storeable {
  private var caches: [String: Any] = [:]
  
  init() {
  }
  
  func add(key: String, value: Any) {
    self.caches[key] = value
  }
  
  func delete(key: String) {
    self.caches.removeValue(forKey: key)
  }
  
  func find(key: String) -> Any? {
    return self.caches[key]
  }
  
  func update(key: String, value: Any) {
    self.caches.updateValue(value, forKey: key)
  }
  
  func removeAll() {
    self.caches.removeAll()
  }
}

class UserDefualtDataStore: Storeable {
  init() {
  }
  
  func add(key: String, value: Any) {
   UserDefaults.standard.set(value, forKey: key)
  }
  
  func delete(key: String) {
    UserDefaults.standard.removeObject(forKey: key)
  }
  
  func find(key: String) -> Any? {
    return UserDefaults.standard.object(forKey: key)
  }
  
  func update(key: String, value: Any) {
    UserDefaults.standard.set(value, forKey: key)
  }
  
  func removeAll() {
  }
}
