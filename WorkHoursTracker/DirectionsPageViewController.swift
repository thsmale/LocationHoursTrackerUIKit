//
//  DirectionsViewController.swift
//  WorkHoursTracker
//
//  Created by Tommy Smale on 1/8/21.
//

import UIKit

class DirectionsPageViewController: UIPageViewController {
    
    weak var pageControl : UIPageControl!
   // weak var p : UIP
    
    override func loadView() {
        super.loadView()
        
        //let pageControl = UIPageControl
        //self.pageViewController = pageViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .green
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    //func pageViewController(UIPageViewController, willTransitionTo: )

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
