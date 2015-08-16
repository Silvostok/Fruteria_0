//
//  AppDelegate.swift
//  Fruteria
//
//  Created by Miguel Angel Rubio Caballero on 12/08/15.
//  Copyright © 2015 MiguelRubio. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var dataStore: DataStore?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
    
    // Override point for customization after application launch.
    dataStore = loadDataStore("GreenGrocerSeed")
    
    var dso = window?.rootViewController as? DataStoreOwner
    dso?.dataStore = dataStore
    
    applyAppAppearance()
    
    
    return true
  }

}



extension AppDelegate {
  private func loadDataStore(seedPlistName: String) -> DataStore? {
    if DataStore.defaultDataStorePresentOnDisk {
      return DataStore()
    } else {
      // Locate seed data
      let seedURL = NSBundle.mainBundle().URLForResource(seedPlistName, withExtension: "plist")!
      let ds = DataStore(plistURL: seedURL)
      // Save seed data to the documents directory
      ds.save()
      return ds
    }
  }
}

