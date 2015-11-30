//
//  ViewController.swift
//  PageViewControllerExample
//
//  Created by David Rollins on 11/27/15.
//  Copyright © 2015 David Rollins. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    var pageTitles = [String]()
    var pageImages = [String]()
    var pageViewController: UIPageViewController!
    
    @IBAction func startWalkThrough(sender: AnyObject) {
        
        let startingViewController:PageContentViewController = self.viewControllerAtIndex(0)!
        let viewControllers:NSArray = [startingViewController]
        pageViewController.setViewControllers(viewControllers as! [PageContentViewController], direction: .Forward, animated: false, completion: { (complete) -> Void in
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pageTitles = ["Over 200 Tips and Tricks", "Discover Hidden Features", "Bookmark Favorite Tip", "Free Regular Update"];
        pageImages = ["page1.png", "page2.png", "page3.png", "page4.png"];
        
        // Create page view controller
        pageViewController = self.storyboard!.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        pageViewController.dataSource = self;
        
        let startingViewController:PageContentViewController = self.viewControllerAtIndex(0)!
        let viewControllers:NSArray = [startingViewController]
        
        pageViewController.setViewControllers(viewControllers as! [PageContentViewController], direction: .Forward, animated: false, completion: { (complete) -> Void in
        })
        // Change the size of page view controller
        pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
        
        self.addChildViewController(pageViewController)
        self.view.addSubview(pageViewController.view)
        pageViewController.didMoveToParentViewController(self)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        if let controller = viewController as? PageContentViewController {
            
            var index = controller.pageIndex
            
            if (index == NSNotFound) {
                return nil
            }
            
            index = index + 1
            
            if index == pageTitles.count {
                return nil;
            }
            
            return self.viewControllerAtIndex(index)
        }
        
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        if let controller = viewController as? PageContentViewController {
            var index = controller.pageIndex
            if index == 0 {
                return nil
            }
            else{
                index = index - 1
                
                return self.viewControllerAtIndex(index)
            }
        }
        
        return nil
    }
    
    func viewControllerAtIndex(index:Int)->PageContentViewController? {
        
        if pageTitles.count == 0 || index >= pageTitles.count {
            return nil
        }
        
        // Create a new view controller and pass suitable data.
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("PageContentViewController") as! PageContentViewController
        controller.imageFile = self.pageImages[index];
        controller.titleText = self.pageTitles[index];
        controller.pageIndex = index;
        
        return controller
    }
    
    // you must implement both these method for the page indicator to work 
    // also it only work when the page view controller is in scroll mode NOT page curl mode
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return pageTitles.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    // end of methods needed to make page indicator work
    
}

