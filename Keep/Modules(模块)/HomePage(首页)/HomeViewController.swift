//
//  HomeViewController.swift
//  Keep
//
//  Created by 顾钱想 on 2020/9/5.
//  Copyright © 2020 顾钱想. All rights reserved.
//

import UIKit
import NSObject_Rx
let NaviBarHeight = 44;
class HomeViewController: ViewController<ViewModel> {
    let disposeBag = DisposeBag()
    var viewControllerArrs: [UIViewController] = {
        return [AttentionViewController(),
                RecommentViewController(),
                PopularViewController()]
    }()
    var pageViewController: UIPageViewController!
    var lastOffsetY = 0.0
    var btnArrs = [UIButton]()
    var headView: UIView = {
        let headView = UIView.init(frame: CGRect.init(x: 0, y: KStatusBarFrame, width: DEVICE_WIDTH, height: 50))
        return headView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        //设置首页
        pageViewController.setViewControllers([self.viewControllerArrs[1]], direction: .forward, animated: false, completion: nil)

        let names = ["关注","推荐","热门"]
        for i in 0...names.count - 1 {
           let btn = UIButton.init(frame: CGRect.init(x: CGFloat(i)*DEVICE_WIDTH/3, y: 0, width: DEVICE_WIDTH/3, height: 50))
           btn.setTitle(names[i], for: .normal)
           btn.setTitleColor(UIColor.darkText, for: .normal)
           btn.setTitleColor(UIColor.green, for: .selected)
           btn.tag = i
           btn.rx.tap
           .subscribe(onNext: { [weak self] _ in
               _ = self?.btnArrs.map {
                  $0.isSelected = false
               }
               btn.isSelected = !btn.isSelected
               self?.pageViewController.setViewControllers([(self?.viewControllerArrs[btn.tag])!], direction: .forward, animated: false, completion: nil)
           })
           .disposed(by: rx.disposeBag)
           btnArrs.append(btn)
           headView.addSubview(btn)
        }
        btnArrs[1].isSelected = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }

    override func makeUI() {
         super .makeUI()
         self.view.addSubview(headView)
         //翻页样式
         pageViewController = UIPageViewController.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
         self.addChild(pageViewController)
         self.view.addSubview(pageViewController.view)
         self.pageViewController.view.frame = CGRect(x: 0, y: 50 + KStatusBarFrame, width: DEVICE_WIDTH, height: self.view.height - 50 - KStatusBarFrame)
         pageViewController.delegate = self
         pageViewController.dataSource = self
    }
}


extension HomeViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    //获取前一个页面
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = viewControllerArrs.firstIndex(of: viewController) else {return nil}
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            return nil
        }
        guard viewControllerArrs.count > previousIndex else {
            return nil
        }
        return viewControllerArrs[previousIndex]
    }
    //获取后一个页面
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
       guard let viewControllerIndex = viewControllerArrs.firstIndex(of: viewController) else {return nil}
       let nextIndex = viewControllerIndex + 1
       let orderedViewControllersCount = viewControllerArrs.count
       guard orderedViewControllersCount != nextIndex else {
           return nil
       }
       guard orderedViewControllersCount > nextIndex else {
           return nil
       }
       return viewControllerArrs[nextIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let previousIndex = self.viewControllerArrs.firstIndex(of: previousViewControllers.first!)
        let currentIndex = self.viewControllerArrs.firstIndex(of: (pageViewController.viewControllers?.first!)!)
        if (currentIndex != previousIndex) {
            _ = self.btnArrs.map {
              $0.isSelected = false
            }
            btnArrs[currentIndex ?? 1].isSelected = true
        }
    }
}

