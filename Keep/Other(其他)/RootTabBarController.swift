//
//  TableViewController.swift
//  Keep
//
//  Created by 顾钱想 on 2020/9/5.
//  Copyright © 2020 顾钱想. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController {
    override var shouldAutorotate: Bool {
        return false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        delegate = self;
        guard let jsonPath = Bundle.main.path(forResource: "MainVC", ofType: "json")  else {
            return
        }
        guard let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonPath)) else {
            return
        }
        guard let anyObject = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) else {
            return
        }
        guard let dictArray = anyObject as? [[String: AnyObject]] else {
            return
        }
        for dict in dictArray {
            guard let vcName = dict["vcName"] as? String else { continue }
            guard let normalImg = dict["normalImg"] as? String else { continue }
            guard let selImg = dict["selImg"] as? String else { continue }
            guard let tag = dict["tag"] as? Int else { continue }
            guard let title = dict["title"] as? String else { continue }
            addChildVc(childVcName: vcName,
                       normalImg: normalImg,
                       selImg: selImg,
                       tag: tag,
                       title: title)
        }
    }

    deinit {
        print("deinit: \(self)")
    }
}

// MARK: - 设置子控制器
extension RootTabBarController {

    private func addChildVc(childVcName: String, normalImg: String, selImg: String, tag: Int, title: String) {
        let childVc = getVcFromString(childVcName)
        //childVc.tabBarItem.image = UIImage(named: normalImg)
       // childVc.tabBarItem.selectedImage = UIImage(named: selImg)
        childVc.tabBarItem.tag = tag
        childVc.tabBarItem.title = title
        childVc.title = title
        let selectColor = UIColor.init(red: 110/255, green: 204/255, blue: 153/255, alpha: 1)
        let unSelectColor = UIColor.init(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)

        if #available(iOS 13.0, *) {
            tabBar.tintColor = selectColor
            tabBar.unselectedItemTintColor = unSelectColor
        } else {
            childVc.tabBarItem
                .setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unSelectColor],
                                        for: .normal)
            childVc.tabBarItem
                .setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectColor],
                                        for: .selected)
        }
        let childNav = UINavigationController(rootViewController: childVc)
        addChild(childNav)
    }

    private func getVcFromString(_ vcName: String) -> UIViewController {
        guard
            let childVc = vcName.classObject(UIViewController.self)
        else {
            return UIViewController()
        }
        return childVc
    }

}

// MARK: - UITabBarControllerDelegate
extension RootTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}


