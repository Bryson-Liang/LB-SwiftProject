//
//  LBSinaProfileController.swift
//  LBPersonalApp
//
//  Created by MR on 16/5/19.
//  Copyright © 2016年 LB. All rights reserved.
//

import UIKit

class LBSinaProfileController: LBSinaBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
         loginView?.showLoginViewCenterImage("visitordiscover_image_profile", title: "登录后，你的微博、相册、个人资料会显示在这里，展示给别人", isHome: false)
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
