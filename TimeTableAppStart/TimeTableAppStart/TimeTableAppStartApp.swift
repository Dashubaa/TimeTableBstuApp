//
//  TimeTableAppStartApp.swift
//  TimeTableAppStart
//
//  Created by Дарья Шубич on 10.11.23.
//

import SwiftUI
import Firebase



@main
struct TimeTableAppStartApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            LogIn()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
