//
//  InfoAboutCharacter.swift
//  Rick&Morty
//
//  Created by Георгий Матченко on 16.08.2022.
//

import Foundation
import SnapKit
import UIKit

class InfoView: UIView {
    private(set) lazy var backImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "rick_morty")
        view.contentMode = .scaleAspectFill
        return view
    }()

    private(set) lazy var tableView: UITableView = {
        let view = UITableView()
        view.register(CustomInfoCell.self, forCellReuseIdentifier: "cell")
        view.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: "header")
        view.backgroundColor = .clear
//        view.tableHeaderView = HeaderView()
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setTableView()
        setBackgroundView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setViews()
        setTableView()
        setBackgroundView()
    }

    private func setViews() {
        addSubview(backImage)
        addSubview(tableView)
    }
    private func setTableView() {
        tableView.snp.makeConstraints { make in
            make.width.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    private func setBackgroundView() {
        backImage.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.width.equalTo(tableView.snp.width)
        }
    }
}
