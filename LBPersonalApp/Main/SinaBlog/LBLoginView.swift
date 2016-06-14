//
//  LBLoginView.swift
//  LBPersonalApp
//
//  Created by MR on 16/6/13.
//  Copyright © 2016年 LB. All rights reserved.
//

import UIKit

class LBLoginView: UIView {

    //纯代码调用
    override init(frame: CGRect) {
        super.init(frame: frame)
      
        initUI()
    }
    //用xib 或 sb 调用
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK:初始化UI
    private func initUI(){
        backgroundColor = UIColor(white: 237.0 / 255.0, alpha: 1.0)
        
        addSubview(iconView)
        addSubview(maskIconView)
        addSubview(homeIconView)
        addSubview(messageLabel)
        addSubview(registerBtn)
        addSubview(loginBtn)
        
        addViewConstraints()
    }
    
    
    
    
    // MARK:懒加载
    ///图标
    lazy var iconView : UIImageView = {
        let image = UIImage(named: "visitordiscover_feed_image_smallicon")
        return UIImageView(image: image)
    }()
    ///遮罩图片
    lazy var maskIconView : UIImageView = {
        let image = UIImage(named: "visitordiscover_feed_mask_smallicon")
        return UIImageView(image: image)
    }()
    ///房子图标
    lazy var homeIconView : UIImageView = {
        let image = UIImage(named: "visitordiscover_feed_image_house")
        return UIImageView(image: image)
    }()
    ///文字标签
    lazy var messageLabel : UILabel = {
        let label = UILabel(frame:  CGRectMake(0, 60, 240, 40))
        label.text = "登录后，最新、最热微博尽在掌握，不再会与实事潮流擦肩而过"
        label.font = UIFont.systemFontOfSize(14)
        label.textColor = UIColor.darkGrayColor()
        label.textAlignment = NSTextAlignment.Center
        label.preferredMaxLayoutWidth = 224
        label.numberOfLines = 2
        label.sizeToFit()
        return label
    }()
    ///注册按钮
    lazy var registerBtn : UIButton = {
        let btn = UIButton(frame: CGRectMake(0, 0, 100, 40))
        
        btn.setTitle("注册", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        
        return btn
    }()
    ///登录按钮
    lazy var loginBtn : UIButton = {
        let btn = UIButton(frame: CGRectMake(200, 220, 100, 40))
        
        btn.setTitle("登录", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        
        return btn
    }()
    // MARK: 添加约束
    private func addViewConstraints() {
        iconView.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: iconView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: iconView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: -40))
        
        homeIconView.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: homeIconView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: iconView, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: homeIconView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: iconView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0))
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: iconView, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: iconView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 20))
        //宽高用vlf
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[subView(240)]", options: NSLayoutFormatOptions.AlignAllBaseline, metrics: nil, views: ["subView":messageLabel]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[subView(40)]", options: NSLayoutFormatOptions.AlignAllBaseline, metrics: nil, views: ["subView" : messageLabel]))
        
        registerBtn.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: registerBtn, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: messageLabel, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: registerBtn, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: messageLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 20))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[subView(100)]", options: NSLayoutFormatOptions.AlignAllBaseline, metrics: nil, views: ["subView": registerBtn]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[subView(40)]", options: NSLayoutFormatOptions.AlignAllBaseline, metrics: nil, views: ["subView": registerBtn]))
        
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: messageLabel, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: messageLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 20))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[subView(100)]", options: NSLayoutFormatOptions.AlignAllBaseline, metrics: nil, views: ["subView": loginBtn]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[subView(40)]", options: NSLayoutFormatOptions.AlignAllBaseline, metrics: nil, views: ["subView": loginBtn]))
        
        maskIconView.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[subView]|", options: NSLayoutFormatOptions.AlignAllBaseline, metrics: nil, views: ["subView" : maskIconView]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[subView]-160-|", options: NSLayoutFormatOptions.AlignAllBaseline, metrics: nil, views: ["subView" : maskIconView]))
    
    }
}

