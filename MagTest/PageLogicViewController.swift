//
//  PageLogicViewController.swift
//  MagTest
//
//  Created by Magno Augusto Ferreira Ruivo on 16/02/20.
//  Copyright © 2020 Mag. All rights reserved.
//

import UIKit

class PageLogicViewController: UIPageViewController {
    
    var items: [UIViewController] = []
    var pendingPage: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        pendingPage = 0
        dataSource = self
        delegate = self
        
        if let firstViewController = items.first {
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    private func setup(viewController: UIViewController) {
        viewController.view.backgroundColor = .green
    }

}

extension PageLogicViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let previus = (pendingPage ?? 0) - 1
        guard previus >= 0, previus < items.count else {return nil}
        setup(viewController: items[previus])
        return items[previus]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let next = (pendingPage ?? 0) + 1
        guard next != items.count, next < items.count else {return nil}
        setup(viewController: items[next])
        return items[next]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        items.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        0
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        pendingPage = items.firstIndex(of: pendingViewControllers.first!)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
    }
    
}
