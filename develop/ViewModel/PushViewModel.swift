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
import RxCocoa
import SwiftMessages

class PushViewModel: NSObject {
    
    private var deviceToken: String?
    private var fcmToken: String?
    private let disposeBag = DisposeBag()
    
    func bindView(_ view: PushView) {
        
        UserNotificationManager.shared.deviceTokenObserver.subscribe(onNext: { [weak self] token in
            guard let self = self else { return }
            if let token = token {
                view.deviceTokenLabel.text = token
                self.deviceToken = token
            } else {
                view.deviceTokenLabel.text = "取得できていない"
            }
        }).disposed(by: disposeBag)
        
        UserNotificationManager.shared.fcmTokenObserver.subscribe(onNext: { [weak self] token in
            guard let self = self else { return }
            if let token = token {
                view.fcmTokenLabel.text = token
                self.fcmToken = token
            } else {
                view.fcmTokenLabel.text = "取得できていない"
            }
        }).disposed(by: disposeBag)
        
        let dtGesture = UITapGestureRecognizer()
        dtGesture.rx.event.subscribe(onNext: { [weak self] gesture in
            guard let self = self else { return }
            UIPasteboard.general.string = self.deviceToken
            self.showMessage(body: "DeviceTokenをコピーしました")
        }).disposed(by: disposeBag)
        view.deviceTokenLabel.addGestureRecognizer(dtGesture)
        
        let ftGesture = UITapGestureRecognizer()
        ftGesture.rx.event.subscribe(onNext: { [weak self] gesture in
            guard let self = self else { return }
            UIPasteboard.general.string = self.fcmToken
            self.showMessage(body: "FCMTokenをコピーしました")
        }).disposed(by: disposeBag)
        view.fcmTokenLabel.addGestureRecognizer(ftGesture)
    }
    
    func showMessage(body: String) {
        let view = MessageView.viewFromNib(layout: .statusLine)
        view.configureTheme(.info)
        view.configureContent(body: body)
        SwiftMessages.show(view: view)
    }
}
