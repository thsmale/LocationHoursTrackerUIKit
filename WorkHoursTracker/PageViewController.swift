//
//  PageViewController.swift
//  WorkHoursTracker
//
//  Created by Tommy Smale on 1/8/21.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var pages = [UIViewController]()
    weak var pageControl : UIPageControl!
   // weak var p : UIP
    
    override func loadView() {
        super.loadView()
        
        let margins = view.safeAreaLayoutGuide
        
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            //pageControl.centerYAnchor.constraint(equalTo: margins.centerYAnchor)
            //margins.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            //margins.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            //margins.topAnchor.constraint(equalTo: margins.topAnchor),
            pageControl.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -8)
        ])
        self.pageControl = pageControl

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.dataSource = self
        self.delegate = self
        
        view.backgroundColor = .red
        
        pages.append(FirstInstructionViewController())
        pages.append(SecondInstructionViewController())
        
        pageControl.numberOfPages = self.pages.count
        pageControl.currentPage = 0
        //pageControl.pageIndicatorTintColor = UIColor.systemGreen
        pageControl.currentPageIndicatorTintColor = UIColor.systemPurple
        pageControl.addTarget(self, action: #selector(self.pageControlValueDidChange(sender:)), for: .valueChanged)
        
        setViewControllers([pages[pageControl.currentPage]], direction: .forward, animated: true, completion: nil)
    }
    
    //MARK: DataSource
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = self.pages.firstIndex(of: viewController) else {
            return nil
        }
        //print("viewControllerBefore index \(index)")
        if index == 0 {
            return self.pages.last
        }
        return self.pages[index-1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        //Return view controller after the given view controller or nil to indicate there is no next view controller
        guard let index = self.pages.firstIndex(of: viewController) else {
            return nil
        }
        //print("viewControllerAfter index \(index)")
        if index + 1 == self.pages.count {
            return self.pages.first
        }
        return self.pages[index+1]
    }
    
    //MARK: Delegate
    /*
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        print("willTransitionTo")
    }
     */
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed,
           let visibleViewController = pageViewController.viewControllers?.first,
           let index = self.pages.firstIndex(of: visibleViewController)
        {
            //print("didFinishAnimating index \(index)")
            self.pageControl.currentPage = index
        }
    }
    
    //Target-action
    @objc func pageControlValueDidChange(sender: UIPageControl) {
        self.pageControl.currentPage = sender.currentPage
        print("pageControlValueDidChange")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
