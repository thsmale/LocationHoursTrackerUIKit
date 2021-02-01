//
//  CustomSearchBar.swift
//  WorkHoursTracker
//
//  Created by Tommy Smale on 1/11/21.
//

import UIKit

class CustomSearchBar: UISearchBar {
    
    weak var searchBar : UISearchBar! 

    override func loadView() {
        super.loadView()
        
        let margins = view.safeAreaLayoutGuide
        
        
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)
        NSLayoutConstraint.activate([
            searchBar.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            searchBar.topAnchor.constraint(equalTo: margins.topAnchor)
        ])
        self.searchBar = searchBar
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
