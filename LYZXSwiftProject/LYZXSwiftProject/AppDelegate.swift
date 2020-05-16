//
//  AppDelegate.swift
//  LYZXSwiftProject
//
//  Created by yangou on 2020/5/7.
//  Copyright © 2020 hello. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


   var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
             
         let rootVC = YOTabChangeViewController()
         rootVC.view.backgroundColor = .white
        window?.rootViewController = getTheRootViewController()
        window?.makeKeyAndVisible()

        
//        getTokenWithTheProject()
//
        
        return true
    }
    
    
    
    
    
    func getTheRootViewController() -> UIViewController {
        
        
        let userDefault = UserDefaults.standard
        let loginStatus: String? = userDefault.string(forKey: K_loginStatus)
       print("当前登录的状态是  \(loginStatus!)")
        if loginStatus == "0" {
            
            //未登录状态跳转到选择登录页面
            let rootVC = YOLoginChooseViewController()
            let navVC = UINavigationController.init(rootViewController: rootVC)
            return navVC
            
        }else{
            
            let rootVC = YOTabChangeViewController()
            return rootVC
            
            
        }
       
        
    }
    
    
    /**
     获取项目的token
     */
    
    private func getTokenWithTheProject(){
        
        YONewWorkRequestTool.requestTool.getPeojectTokenWith(Task: "ACCESSS_TOKEN") { (response) in
            
            let expireString = response.data!["expired_time"] as! NSNumber
            let projectToken = response.data!["access_token"] as! String
            let user = UserDefaults.standard
            user.set(expireString, forKey: "expired_time")
            user.set(projectToken, forKey: "access_token")
           
            print("网络获取的是  \(projectToken)")
        }

        
    }
    
    
    
     func applicationWillResignActive(_ application: UIApplication) {
           // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
           // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
       }

       func applicationDidEnterBackground(_ application: UIApplication) {
           // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
           // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
       }

       func applicationWillEnterForeground(_ application: UIApplication) {
           // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
       }

       func applicationDidBecomeActive(_ application: UIApplication) {
           // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
       }

       func applicationWillTerminate(_ application: UIApplication) {
           // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
       }



}

