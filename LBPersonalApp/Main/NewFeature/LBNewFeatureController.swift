//
//  LBNewFeatureController.swift
//  LBPersonalApp
//
//  Created by MR on 16/6/20.
//  Copyright © 2016年 LB. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class LBNewFeatureController: UICollectionViewController {

    // MARK:属性
    let layout = UICollectionViewFlowLayout()
    // MARK:构造函数
    init(){
        super.init(collectionViewLayout: layout)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:父类方法
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.registerClass(LBNewFeatureItem.self, forCellWithReuseIdentifier: reuseIdentifier)
        initUI()
    }
    // MARK:初始化UI
    private func initUI(){
        layout.itemSize = self.collectionView!.bounds.size
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        self.collectionView?.bounces = false
        self.collectionView?.showsHorizontalScrollIndicator = false
        self.collectionView?.pagingEnabled = true
    }
    // MARK: UICollectionViewDataSource
    let itemCount = 4
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemCount
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! LBNewFeatureItem
        cell.imageIndex = indexPath.item
        return cell
    }
    // MARK:UICollectionViewDelegate
    ///cell停止滚动
    override func collectionView(collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        let visibleIndex = collectionView.indexPathsForVisibleItems().last!
        if visibleIndex.item == itemCount - 1 {
             let cell = collectionView .cellForItemAtIndexPath(visibleIndex) as! LBNewFeatureItem
            cell.startAnimation()
        }
       
        
    }
}
// MARK:-
class LBNewFeatureItem :UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(iconView)
        addSubview(button)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        iconView.frame = self.bounds
        button.frame = CGRectMake((bounds.size.width/2 - 52) ,bounds.size.height - 200, 105, 36)
    }
    // MARK:开启动画
    private func startAnimation(){
        button.hidden = false
        button.transform = CGAffineTransformMakeScale(0, 0)
        UIView.animateWithDuration(1, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: UIViewAnimationOptions(rawValue: 0), animations: { () -> Void in
                self.button.transform = CGAffineTransformIdentity
            }) { (_) -> Void in
            print("动画完成")
            self.button.userInteractionEnabled = true
        }
    }
    // MARK:点击事件
    func startBtnClick() {
        NSNotificationCenter.defaultCenter().postNotificationName(LBSwitchRootVCNotification, object: true)
    }
    // MARK:属性
    var imageIndex : Int = 0 {
        didSet{
            iconView.image = UIImage(named: "new_feature_\(imageIndex+1)")
            button.hidden = true
        }
    }
    // MARK:懒加载
    private lazy var button : UIButton = {
        let btn = UIButton()
        btn.userInteractionEnabled = false
        btn.setBackgroundImage(UIImage(named: "new_feature_finish_button"), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "new_feature_finish_button_highlighted"), forState: UIControlState.Highlighted)
        btn.setTitle("开始体验", forState: UIControlState.Normal)
        btn.addTarget(self, action: "startBtnClick", forControlEvents: UIControlEvents.TouchUpInside)
        return btn
    }()

    private lazy var iconView : UIImageView = {
        return UIImageView()
    }()
}
