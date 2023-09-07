//
//  Pokedex_PlatziApp.swift
//  Pokedex-Platzi
//
//  Created by Camilo Lezcano on 2/09/23.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}

@main
struct Pokedex_PlatziApp: App {
        let persistenceController = PersistenceController.shared
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    
    var body: some Scene {
        WindowGroup {
            
            if let user = authenticationViewModel.user {
                TabViewPokedex(createAccount: .constant(true), login: .constant(true))
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            } else {
                
                SplashScreen()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
}
