//
//  KabigonOnoPageViewController.swift
//  Sample1128
//
//

import Foundation
import UIKit

class HomeBackgroundPageViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
      var pageViewController: UIPageViewController!
      var viewControllersArray: Array<UIViewController> = []
      let colors: Array<UIColor> = [.red, .gray, .blue]
      var pageControl: UIPageControl!
   
    override func viewDidLoad() {
           super.viewDidLoad()
           self.view.backgroundColor = .white
           
           for index in 0 ..< colors.count {
               let viewController = UIViewController()
               viewController.view.backgroundColor = colors[index]
               viewController.view.tag = index
               viewControllersArray.append(viewController)
           }
           pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
           pageViewController.dataSource = self
           pageViewController.delegate = self
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
