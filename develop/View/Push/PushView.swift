//
//  PushView.swift
//  develop
//
//  Created by yukithehero on 2018/11/03.
//  Copyright © 2018 aikizoku. All rights reserved.
//

import Foundation
import UIKit

class PushView: UIView {
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var deviceTokenLabel: UILabel!
    @IBOutlet weak var fcmTokenLabel: UILabel!
    
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
    }
}
