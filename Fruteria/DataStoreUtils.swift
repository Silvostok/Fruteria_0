//
//  DataStoreUtils.swift
//  Fruteria
//
//  Created by Miguel Angel Rubio Caballero on 14/08/15.
//  Copyright © 2015 MiguelRubio. All rights reserved.
//

import UIKit

protocol DataStoreOwner {
  var dataStore : DataStore? { get set }
  
  func passDataStoreToChildren()
}


extension DataStoreOwner where Self : UIViewController {
  func passDataStoreToChildren() {
    for vc in childViewControllers {
      var dso = vc as? DataStoreOwner
      dso?.dataStore = dataStore
    }
  }
}