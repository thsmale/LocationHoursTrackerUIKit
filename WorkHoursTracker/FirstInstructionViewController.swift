//
//  FirstInstructionViewController.swift
//  WorkHoursTracker
//
//  Created by Tommy Smale on 1/8/21.
//

import UIKit

class FirstInstructionViewController: UIViewController {
    
    weak var textView : UITextView!
    weak var label: UILabel!
    
    override func loadView() {
        super.loadView()
        
        let margins = view.safeAreaLayoutGuide
        
        /*
        let textView = UITextView(frame: .zero, textContainer: nil)
        textView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textView)
        NSLayoutConstraint.activate([
            textView.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            textView.centerYAnchor.constraint(equalTo: margins.centerYAnchor),
            /*
            textView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
            textView.topAnchor.constraint(equalTo: margins.topAnchor),
            textView.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
             */
        ])
        self.textView = textView
        */
                
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: margins.centerYAnchor)
            /*
            label.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 8),
            label.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 8)
             */
        ])
        self.label = label
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        /*
        view.backgroundColor = .yellow
        textView.text = "Enter the location to record hours spent there"
        textView.backgroundColor = .blue
        textView.layer.borderWidth = 4
        textView.layer.borderColor = CGColor(red: 12, green: 100, blue: 155, alpha: 0)
         */
        
        label.text = "Instruction 0"
        label.numberOfLines = 2
        label.layer.borderWidth = 4
        label.layer.borderColor = CGColor(red: 12, green: 100, blue: 155, alpha: 0)

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
