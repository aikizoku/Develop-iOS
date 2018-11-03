//
//  PushViewModel.swift
//  develop
//
//  Created by yukithehero on 2018/11/03.
//  Copyright © 2018 aikizoku. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class PushViewModel: NSObject {
    
    private let disposeBag = DisposeBag()
    
    func bindView(_ view: PushView) {
        
        UserNotificationManager.shared.deviceTokenObserver.subscribe(onNext: { token in
            if let token = token {
                view.deviceTokenLabel.text = token
            } else {
                view.deviceTokenLabel.text = "取得できていない"
            }
        }).disposed(by: disposeBag)
        
        UserNotificationManager.shared.fcmTokenObserver.subscribe(onNext: { token in
            if let token = token {
                view.fcmTokenLabel.text = token
            } else {
                view.fcmTokenLabel.text = "取得できていない"
            }
        }).disposed(by: disposeBag)
    }
}
