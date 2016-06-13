//
//  LBSinaTabBarController.swift
//  LBPersonalApp
//
//  Created by MR on 16/5/19.
//  Copyright © 2016年 LB. All rights reserved.
//

import UIKit

class LBSinaTabBarController: UITabBarController {
    // MARK:父类方法
    override func viewDidLoad() {
        super.viewDidLoad()

        //替换自定义tabbar
        let sinaTabBar = LBSinaTabBar()
        setValue(sinaTabBar,forKeyPath:"tabBar")
        
        sinaTabBar.middleButton.addTarget(self, action: "addButtonClick", forControlEvents: UIControlEvents.TouchUpInside)
        
        addChildViewControllers()
    
    }
    // MARK:添加子控制器
    private func addChildViewControllers() {
        //添加子控制器
        //加载json文件
        let path = NSBundle.mainBundle().pathForResource("SinaBlogSetting.json", ofType: nil)!
        let data = NSData(contentsOfFile: path)!
        do{
            let array = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
            // 在遍历数组时，必须指明数组中包含对象的类型，包括字典中的格式
            for dict in array as! [[String :String]]{
                addChildControllers(dict["vcName"]!, title: dict["title"]!, imageName: dict["imageName"]!)
            }
            
        }catch {
            print(error)
            //如果json加载错误
            addChildControllers("LBSinaHomeController", title: "首页", imageName:"tabbar_home")
            addChildControllers("LBSinaHomeController", title: "消息", imageName:"tabbar_message_center")
            addChildControllers("LBSinaHomeController", title: "发现", imageName:"tabbar_discover")
            addChildControllers("LBSinaHomeController", title: "我", imageName:"tabbar_profile")
        }
        
        
    }
    private func addChildControllers(vcName : String ,title :String ,imageName : String) {
        
        let vc = stringTransformToViewController(vcName)
        tabBar.tintColor = UIColor.orangeColor()
        vc.title = title
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named:imageName + "_highlighted")
        let navVc = UINavigationController(rootViewController: vc)
        addChildViewController(navVc)
     }
    
    // MARK:字符串转对象
    private func stringTransformToViewController(vcName : String) ->UIViewController{
        /*在swift中类是需要命名空间的, 命名空间默认是项目名称, 同一命名空间全局共享  */
        let projectName = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
        let cls : AnyClass = NSClassFromString(projectName + "." + vcName)!
        print(cls)
        //实例化
        let vc = (cls as! UIViewController.Type).init()
        return vc
    }
    
    // MARK:点击事件
    func addButtonClick() {   /* 监听事件的方法不能私有 */
        print("点击了+号按钮")
    }
}
