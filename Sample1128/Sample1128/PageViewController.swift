//
//  PageViewController.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2021/08/17.
//  Copyright © 2021 TAKESHI SHIMADA. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    var contentVCs = [UIViewController]()
    var currentIndex: Int = 0

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black
        dataSource = self
        delegate = self

        for i in 0..<3 {
            let contentVC = PageContentViewController()
            contentVC.contentNumber = i
            contentVCs.append(contentVC)
        }
        setViewControllers([contentVCs[0]], direction: .forward, animated: true, completion: nil)
    }

    // MARK: - UIPageViewControllerDataSource


    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
   
        guard let index = contentVCs.firstIndex(of: viewController),
              index != NSNotFound else { return nil }
        
        if index < contentVCs.count - 1 {
            return contentVCs[index + 1]
        } else {
            return contentVCs.first
        }

    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = contentVCs.firstIndex(of: viewController),
              index != NSNotFound else { return nil }
        if index > 0 {
            return contentVCs[index - 1]
        } else {
            return contentVCs.last
        }
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return contentVCs.count
    }

    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return currentIndex
    }

    // MARK: - UIPageViewControllerDelegate

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard finished else { return }
        guard let contentVC = pageViewController.viewControllers?.first else { return }
        guard let index = contentVCs.firstIndex(of: contentVC),
              index != NSNotFound else { return }

        currentIndex = index
    }

}
