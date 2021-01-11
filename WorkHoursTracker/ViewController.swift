//
//  ViewController.swift
//  WorkHoursTracker
//
//  Created by Tommy Smale on 1/5/21.
//

import UIKit

class ViewController: UIViewController {
    
    weak var pageViewController : UIPageViewController!
    
    override func loadView() {
        super.loadView()
        
        let margins = view.safeAreaLayoutGuide
        
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

