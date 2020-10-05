//
//  FirstViewController.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2019/11/28.
//  Copyright © 2019 TAKESHI SHIMADA. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    var pageViewController:UIPageViewController!
    var viewControllersArray:Array<UIViewController> = []
    let colors:Array<UIColor> = [UIColor.red, UIColor.gray, UIColor.blue, UIColor.yellow]
    var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        //PageViewControllerに表示するViewControllerを生成
        //電子書籍アプリなど、大量のViewControllerを使う場合は一気にインスタンスを作らず、逐次生成する方が良いらしいです
        for index in 0 ..< colors.count {
            let viewController = UIViewController()
            viewController.view.backgroundColor = colors[index]
            viewController.view.tag = index
            let label = UILabel()
            label.text = "page:" + index.description
            label.textColor = .white
            label.font = UIFont.boldSystemFont(ofSize: 40)
            label.frame = self.view.frame
            label.textAlignment = .center
            viewController.view.addSubview(label)
            viewControllersArray.append(viewController)
        }
        
        //PageViewControllerの生成
        pageViewController = UIPageViewController(transitionStyle: UIPageViewController.TransitionStyle.scroll,
                                                  navigationOrientation: UIPageViewController.NavigationOrientation.horizontal,
                                                  options: nil)
        //DelegateとDataSouceの設定
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        //はじめに生成するページを設定
        pageViewController.setViewControllers([viewControllersArray.first!], direction: .forward, animated: true, completion: nil)
        pageViewController.view.frame = self.view.frame
        self.view.addSubview(pageViewController.view!)
        
        
        //PageControlの生成
        pageControl = UIPageControl(frame: CGRect(x:0, y:self.view.frame.height - 100, width:self.view.frame.width, height:50))
        pageControl.backgroundColor = .orange
        
        // PageControlするページ数を設定する.
        pageControl.numberOfPages = colors.count
        
        // 現在ページを設定する.
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = false
        self.view.addSubview(pageControl)
        
        scrollToPage(0, animated: false)
    }
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        scrollToPage(3, animated: false)

    }
    
    private func scrollToPage(_ page: Int, from oldPage: Int = 0, animated: Bool) {
        pageViewController.setViewControllers([viewControllersArray[page]],
                           direction: page >= oldPage ? .forward : .reverse,
                           animated: animated,
                           completion: nil)
    }

    
    //DataSourceのメソッド
    //指定されたViewControllerの前にViewControllerを返す
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = viewController.view.tag
        pageControl.currentPage = index
        if index == colors.count - 1{
            return nil
        }
        index = index + 1
        return viewControllersArray[index]
    }
    
    //DataSourceのメソッド
    //指定されたViewControllerの前にViewControllerを返す
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = viewController.view.tag
        pageControl.currentPage = index
        index = index - 1
        if index < 0{
            return nil
        }
        return viewControllersArray[index]
    }
    
    //Viewが変更されると呼ばれる
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating: Bool, previousViewControllers: [UIViewController], transitionCompleted: Bool) {
        print("moved")
    }
}

