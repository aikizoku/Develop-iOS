//
//  MainViewController.swift
//  develop
//
//  Created by yukithehero on 2018/11/02.
//  Copyright © 2018 aikizoku. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class MainViewController: UIViewController {
    @IBOutlet weak var mainView: MainView!
    
    let mainVM = MainViewModel()
    let disposeBag = DisposeBag()
    
    class func instantiate() -> MainViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainVM.bindView(mainView)
        mainVM.onSelectedRowObserver.subscribe(onNext: { [weak self] row in
            guard let `self` = self else { return }
            let vc = PushViewController.instantiate()
            self.navigationController?.pushViewController(vc, animated: true)
        }).disposed(by: disposeBag)
    }
}
