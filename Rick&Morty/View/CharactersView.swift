//
//  CharactersView.swift
//  Rick&Morty
//
//  Created by Георгий Матченко on 16.08.2022.
//

import Foundation
import UIKit

class CharactersView: UIView {
    private(set) lazy var tableView: UITableView = {
        let tv = UITableView()
//        как задать размер width heigh?
//        tv.frame = CGRect(x: 0, y: 0, width: 400, height: 900)
        tv.backgroundColor = .clear
        tv.register(CustomCell.self, forCellReuseIdentifier: "cell")
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setTableView()
    }
    
    required init?(coder Decoder: NSCoder) {
        super.init(coder: Decoder)
        setViews()
        setTableView()
    }
    
    private func setViews() {
        addSubview(tableView)
    }
    
    private func setTableView() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.width.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(safeAreaLayoutGuide)
            
        }
    }
}
