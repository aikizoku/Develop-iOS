//
//  PushViewController.swift
//  develop
//
//  Created by yukithehero on 2018/11/02.
//  Copyright © 2018 aikizoku. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class PushViewController: UIViewController {
    @IBOutlet weak var pushView: PushView!
    
    let pushVM = PushViewModel()
    
    class func instantiate() -> PushViewController {
        let vc = UIStoryboard(name: "Push", bundle: nil).instantiateViewController(withIdentifier: "PushViewController") as! PushViewController
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pushVM.bindView(pushView)
    }
}
