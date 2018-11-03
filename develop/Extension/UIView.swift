//
//  UIView.swift
//  develop
//
//  Created by yukithehero on 2018/11/02.
//  Copyright © 2018 aikizoku. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func loadNib(name: String) {
        Bundle.main.loadNibNamed(name, owner: self, options: nil)
    }
    
    func bind(_ view: UIView) {
        addSubview(view)
        fit(view)
    }
    
    func fit(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: topAnchor, constant: 0.0).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0.0).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0.0).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0).isActive = true
    }
    
    func removeAllSubviews() {
        for subview in subviews {
            subview.removeFromSuperview()
        }
    }
}
