//
//  SimpleTableViewCell.swift
//  develop
//
//  Created by yukithehero on 2018/11/02.
//  Copyright © 2018 aikizoku. All rights reserved.
//

import Foundation
import UIKit

class SimpleTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static var cellHeight: CGFloat {
        return 60
    }
    
    func setText(title: String?, detail: String?) {
        titleLabel.text = title
        detailLabel.text = detail
    }
}
