//
//  UserListTableViewCell.swift
//  WorldWether
//
//  Created by gokul v on 25/07/24.
//

import UIKit

class UserListTableViewCell: UITableViewCell {
    
    static let identifier = "UserListTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
