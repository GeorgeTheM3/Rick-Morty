//
//  EpisodeView.swift
//  Rick&Morty
//
//  Created by Георгий Матченко on 22.08.2022.
//

import Foundation
import UIKit

class Episode: UIView {
    private(set) lazy var tableView: UITableView = {
        let view = UITableView()
        view.register(CharacterCell.self, forCellReuseIdentifier: "cell")
        view.register(<#T##nib: UINib?##UINib?#>, forCellReuseIdentifier: <#T##String#>)
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setViews()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addViews()
        setViews()
    }

    private func addViews() {
        addSubview(tableView)
    }
    private func setViews() {
        setTableView()
    }

    private func setTableView() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.width.equalTo(safeAreaLayoutGuide)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
}
