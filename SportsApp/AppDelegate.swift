//
//  AppDelegate.swift
//  SportsApp
//
//  Created by Ayush Patel on 7/25/20.
//  Copyright © 2020 Ayush Patel. All rights reserved.
//

import UIKit
import UserNotifications
import RadarSDK

@UIApplicationMain
class AppDelegate: UIResponder, UNUserNotificationCenterDelegate, UIApplicationDelegate, RadarDelegate {
    func didReceiveEvents(_ events: [RadarEvent], user: RadarUser) {
        
    }
    
    func didUpdateLocation(_ location: CLLocation, user: RadarUser) {
        
    }
    
    func didUpdateClientLocation(_ location: CLLocation, stopped: Bool, source: RadarLocationSource) {
        
    }
    
    func didFail(status: RadarStatus) {
    
    }
    
    func didLog(message: String) {
    
    }
    

    
    let locationManager = CLLocationManager()

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        Radar.initialize(publishableKey: "prj_test_sk_c315de0292a56ef8ff55a1e234e531db26966669")
        
        print("hello")
        
        Radar.setLogLevel(.debug)
        Radar.setDelegate(self)
        locationManager.requestAlwaysAuthorization()

        
        if UIApplication.shared.applicationState != .background {
            Radar.getLocation { (status, location, stopped) in
                print("Location: status = \(Radar.stringForStatus(status)); location = \(String(describing: location))")
            }
            
            Radar.trackOnce { (status, location, events, user) in
                print("Track once: status = \(Radar.stringForStatus(status)); location = \(String(describing: location)); events = \(String(describing: events)); user = \(String(describing: user))")
            }
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

