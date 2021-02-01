//
//  ResultsTableViewCell.swift
//  WorkHoursTracker
//
//  Created by Tommy Smale on 1/22/21.
//

import UIKit

class ResultsTableViewCell: UITableViewCell {

    let tableViewCellIdentifier = "cellID"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: tableViewCellIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
