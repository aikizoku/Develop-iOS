//
//  MainViewModel.swift
//  develop
//
//  Created by yukithehero on 2018/11/02.
//  Copyright © 2018 aikizoku. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class MainViewModel: NSObject {
    
    enum Row {
        case push
        
        var title: String {
            switch self {
            case .push:
                return "プッシュ通知"
            }
        }
        
        var detail: String? {
            switch self {
            case .push:
                return "Pushに関する情報を表示したり、APIを実行したりする"
            }
        }
    }
    
    let onSelectedRowObserver = PublishSubject<Row>()
    
    private var rows: [Row] = [
        .push
    ]
    
    private let disposeBag = DisposeBag()
    
    func bindView(_ view: MainView) {
        view.tableView.dataSource = self
        view.tableView.delegate = self
    }
}

extension MainViewModel: UITableViewDataSource, UITableViewDelegate {
    
    // Section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    // Cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SimpleTableViewCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(type: SimpleTableViewCell.self, indexPath: indexPath)
        cell.setText(title: row.title, detail: row.detail)
        return cell
    }
    
    // Select
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        onSelectedRowObserver.onNext(rows[indexPath.row])
    }
}
