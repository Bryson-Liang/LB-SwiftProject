//
//  LBSinaMessageController.swift
//  LBPersonalApp
//
//  Created by MR on 16/5/19.
//  Copyright © 2016年 LB. All rights reserved.
//

import UIKit

class LBSinaMessageController: LBSinaBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loginView?.showLoginViewCenterImage("visitordiscover_image_message", title: "登录后，别人评论你的微博，发给你的消息，都会在这里收到通知", isHome: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
