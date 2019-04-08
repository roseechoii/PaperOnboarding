//
//  AppDelegate.swift
//  PaperOnboarding
//
//  Created by Roseanne Choi on 4/6/19.
//  Copyright © 2019 Roseanne Choi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        var initialViewController = storyBoard.instantiateViewController(withIdentifier: "Onboarding")
        
        let userDefaults = UserDefaults.standard
        
        if (userDefaults.bool(forKey: "onboardingComplete"))
        {
            initialViewController = storyBoard.instantiateViewController(withIdentifier: "Mainapp")
        }
        
        window!.rootViewController = initialViewController
        window!.makeKeyAndVisible()
        
        return true
    }
}

