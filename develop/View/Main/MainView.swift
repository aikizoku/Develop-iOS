//
//  MainView.swift
//  develop
//
//  Created by yukithehero on 2018/11/02.
//  Copyright © 2018 aikizoku. All rights reserved.
//

import Foundation
import UIKit

class MainView: UIView {
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initViews()
    }
    
    fileprivate func initViews() {
        loadNib(name: className)
        bind(contentView)
        
        tableView.register(cellType: SimpleTableViewCell.self)
    }
}
