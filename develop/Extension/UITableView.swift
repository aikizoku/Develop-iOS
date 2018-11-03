//
//  UITableView.swift
//  develop
//
//  Created by yukithehero on 2018/11/02.
//  Copyright © 2018 aikizoku. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    /**
     Cell登録の短縮
     */
    func register<T: UITableViewCell>(cellType: T.Type) {
        let className = cellType.className
        register(UINib(nibName: className, bundle: nil), forCellReuseIdentifier: className)
    }
    
    /**
     Cell登録の短縮(複数)
     */
    func register<T: UITableViewCell>(cellTypes: [T.Type]) {
        for cellType in cellTypes {
            register(cellType: cellType)
        }
    }
    
    /**
     Cell再利用の短縮
     */
    func dequeueReusableCell<T: UITableViewCell>(type: T.Type, indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: type.className, for: indexPath) as! T
    }
    
    /**
     HeaderFooterView登録の短縮
     */
    func register<T: UITableViewHeaderFooterView>(headerFooterViewType: T.Type) {
        let className = headerFooterViewType.className
        register(UINib(nibName: className, bundle: nil), forHeaderFooterViewReuseIdentifier: className)
    }
    
    /**
     HeaderFooterView登録の短縮(複数)
     */
    func register<T: UITableViewHeaderFooterView>(headerFooterViewTypes: [T.Type]) {
        for headerFooterViewType in headerFooterViewTypes {
            register(headerFooterViewType: headerFooterViewType)
        }
    }
    
    /**
     HeaderFooterView再利用の短縮
     */
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(type: T.Type) -> T {
        return dequeueReusableHeaderFooterView(withIdentifier: type.className) as! T
    }
}
