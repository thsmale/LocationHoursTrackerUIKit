//
//  SecondInstructionViewController.swift
//  WorkHoursTracker
//
//  Created by Tommy Smale on 1/8/21.
//

import UIKit

class SecondInstructionViewController: UIViewController {
    
    var label : UILabel!
    
    override func loadView() {
        super.loadView()
        
        let margins = view.safeAreaLayoutGuide
        
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: margins.centerYAnchor)
        ])
        self.label = label
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
        //label.text = "Time spent there will be logged by date and hours"
        label.text = "Instruction 1"
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
