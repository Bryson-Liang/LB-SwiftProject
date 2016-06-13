//
//  LBSinaTabBar.swift
//  LBPersonalApp
//
//  Created by MR on 16/5/20.
//  Copyright © 2016年 LB. All rights reserved.
//

import UIKit
class LBSinaTabBar: UITabBar {

    ///按钮总数
    private let buttonCount = 5
    
    
    // MARK:布局子控件
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let width = bounds.width / CGFloat(buttonCount)
        let rect  = CGRectMake(0, 0, width, bounds.height)
        var index = 0
        for view in subviews{
            if view is UIControl && !(view is UIButton){
                view.frame = CGRectOffset(rect, CGFloat(index) * width, 0) //CGRectOffset 偏移
                
                index += index == 1 ? 2 : 1
            }
        }
        
        //添加中间按钮
        middleButton.frame = CGRectOffset(rect, width * 2, 0)
    }
    
    // MARK:懒加载
    lazy var middleButton : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Selected)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Selected)
        
        self.addSubview(btn) // 闭包里要用self
        return btn
    }()
}
