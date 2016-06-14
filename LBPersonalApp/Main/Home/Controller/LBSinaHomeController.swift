//
//  LBSinaHomeController.swift
//  LBPersonalApp
//
//  Created by MR on 16/5/19.
//  Copyright © 2016年 LB. All rights reserved.
//

import UIKit

class LBSinaHomeController: LBSinaBaseController {
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView?.showLoginViewCenterImage("visitordiscover_feed_image_house", title: "关注一些人，回这里看看有什么惊喜", isHome: true)
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        loginView?.setupLoginViewAnimate()
    }
}
