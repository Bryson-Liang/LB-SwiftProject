//
//  LBSinaBaseController.swift
//  LBPersonalApp
//
//  Created by MR on 16/6/12.
//  Copyright © 2016年 LB. All rights reserved.
//

import UIKit

class LBSinaBaseController: UITableViewController,LoginViewDelegate {

    var userLogin = false
    var loginView : LBLoginView?
    //替换根试图要在loadView 里替换
    override func loadView() {
        
        userLogin ? super.loadView() : setLoginView()
    }
    // MARK:登录视图
    private func setLoginView() {
        loginView = LBLoginView()
        loginView?.delegate = self
        view = loginView
        
        //设置navBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: UIBarButtonItemStyle.Plain, target: self, action: "visitorLoginButtonClicked")
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.Plain, target: self, action: "visitorRegisterButtonClicked")
    }

   // MARK: 协议
    func visitorRegisterButtonClicked() {
        print("注册")
    }
    
    func visitorLoginButtonClicked() {
        let oauthVc = LBSinaOAuthController()
        let nav = UINavigationController(rootViewController: oauthVc)
        presentViewController(nav, animated: true, completion: nil)
    }
    
}
