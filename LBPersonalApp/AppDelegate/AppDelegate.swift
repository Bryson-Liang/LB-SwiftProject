//
//  AppDelegate.swift
//  LBPersonalApp
//
//  Created by MR on 16/5/19.
//  Copyright © 2016年 LB. All rights reserved.
//

import UIKit
import AFNetworking

/// 切换根控制器的通知
let LBSwitchRootVCNotification = "LBSwitchRootVCNotification"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let k_sandboxVersionKey = "sandboxVersionKey"
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        //设置网路指示器
        AFNetworkActivityIndicatorManager.sharedManager().enabled = true
        //设置网络缓存
        let urlCache = NSURLCache(memoryCapacity: 4*1024*1024, diskCapacity: 20*1024*1024, diskPath: nil)
        NSURLCache.setSharedURLCache(urlCache)
        
        setupAppearance()
        
        window = UIWindow(frame:UIScreen.mainScreen().bounds)
        window?.rootViewController = defaultController()
        window?.makeKeyAndVisible()
        
        
        //注册通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "switchViewController:", name: LBSwitchRootVCNotification, object: nil)
    
        return true
    }
    // MARK: 判断入口
    private func defaultController() -> UIViewController {
        if !LBUserAccount.isUserLogin {
            print("用户还没登录")
            return LBSinaTabBarController()//用户没登录
        }
        print("用户已登录")
        return isNewVersion() ? LBNewFeatureController() : LBWelcomeController()
    }
    //判断版本
    private func isNewVersion() -> Bool {
        
        let version = Double(NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"] as! String)!
        let preVersion = NSUserDefaults.standardUserDefaults().doubleForKey(k_sandboxVersionKey)
        
        NSUserDefaults.standardUserDefaults().setDouble(version, forKey: k_sandboxVersionKey)
        print("现在版本是\(version)")
        print("之前版本是\(preVersion)")

        return version != preVersion
    }
    // MARK:全局外观
    private func setupAppearance(){
        UINavigationBar.appearance().tintColor = UIColor.orangeColor()
        UITabBar.appearance().tintColor = UIColor.orangeColor()
    }
    // MARK:切换根控制器
    func switchViewController(notice : NSNotification) {
        let isMainVc = notice.object as! Bool
        window?.rootViewController = isMainVc ? LBSinaTabBarController() : LBWelcomeController()
    }
    
  
    
    
    
    
    
    
    
    
    
    
    
    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

