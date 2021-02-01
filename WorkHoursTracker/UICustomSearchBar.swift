//
//  UICustomSearchBar.swift
//  WorkHoursTracker
//
//  Created by Tommy Smale on 1/11/21.
//

import UIKit

class UICustomSearchBar: UISearchBar {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

//MARK: UISearchBarDelegate
extension UICustomSearchBar: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //Method also invoked when text is being cleared from searchBar
        searchBar.text = searchText
        print("textDidChange searchText = \(searchText)")
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
