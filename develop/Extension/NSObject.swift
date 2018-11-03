//
//  NSObject.swift
//  develop
//
//  Created by yukithehero on 2018/11/02.
//  Copyright © 2018 aikizoku. All rights reserved.
//

import Foundation

extension NSObject {
    
    class var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
}
