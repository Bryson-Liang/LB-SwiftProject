//
//  LBWelcomeController.swift
//  LBPersonalApp
//
//  Created by MR on 16/6/21.
//  Copyright © 2016年 LB. All rights reserved.
//

import UIKit

class LBWelcomeController: UIViewController {

    // MARK:属性
    private var iconConstraint : NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        startAnimation()
    }
    private func startAnimation(){
        iconConstraint?.constant = -500
        UIView.animateWithDuration(1.2, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: UIViewAnimationOptions(rawValue: 0), animations: { 
                self.view.layoutIfNeeded()
            }) { (_) -> Void in
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.titleLable.alpha = 1
                    }, completion: { (_) -> Void in
                       NSNotificationCenter.defaultCenter().postNotificationName(LBSwitchRootVCNotification, object: true)
                })
        }
    }
    private func initUI(){
        view.addSubview(backgroundImage)
        view.addSubview(iconView)
        view.addSubview(titleLable)
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        iconView.translatesAutoresizingMaskIntoConstraints        = false
        titleLable.translatesAutoresizingMaskIntoConstraints      = false
        
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[biv]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["biv" : backgroundImage]))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[biv]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["biv" : backgroundImage]))
        
        view.addConstraint(NSLayoutConstraint(item: iconView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        iconConstraint = NSLayoutConstraint(item: iconView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: -160)
        view.addConstraint(iconConstraint!)

        view.addConstraint(NSLayoutConstraint(item: titleLable, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: iconView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: titleLable, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: iconView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 16))
    }
    
    // MARK:懒加载
    private lazy var backgroundImage : UIImageView = {
       return UIImageView(image: UIImage(named: "ad_background"))
    }()
    private lazy var iconView : UIImageView = {
        let view =  UIImageView(image: UIImage(named: "avatar_default_big"))
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 42.5
        return view
    }()
    private lazy var titleLable : UILabel = {
        let view = UILabel()
        view.text = "欢迎回来"
        view.alpha = 0
        view.font = UIFont.systemFontOfSize(14)
        view.textColor = UIColor.grayColor()
        view.sizeToFit()
        return view
    }()
   
}
