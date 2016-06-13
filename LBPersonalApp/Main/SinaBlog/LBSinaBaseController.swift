//
//  LBSinaBaseController.swift
//  LBPersonalApp
//
//  Created by MR on 16/6/12.
//  Copyright © 2016年 LB. All rights reserved.
//

import UIKit

class LBSinaBaseController: UITableViewController {

    var userLogin = false
    //替换根试图要在loadView 里替换
    override func loadView() {
        
        userLogin ? super.loadView() : setLoginView()
    }
    // MARK:登录视图
    private func setLoginView() {
        view = UIView()
        
    }

   
}
