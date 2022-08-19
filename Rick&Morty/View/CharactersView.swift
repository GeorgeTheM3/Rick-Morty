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
        let view = UITableView()
//        как задать размер width heigh?
//        tv.frame = CGRect(x: 0, y: 0, width: 400, height: 900)
        view.backgroundColor = .clear
        view.register(CustomCell.self, forCellReuseIdentifier: "cell")
        return view
    }()

    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "rick")
        image.contentMode = .scaleAspectFill
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setTableView()
        setBackground()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setViews()
        setTableView()
        setBackground()
    }

    private func setViews() {
        addSubview(backgroundImage)
        addSubview(tableView)
    }

    private func setTableView() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.width.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(safeAreaLayoutGuide)
        }
    }
    private func setBackground() {
        backgroundImage.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.leading.equalTo(0)
            make.bottom.equalTo(0)
            make.trailing.equalTo(0)
        }
    }
}
