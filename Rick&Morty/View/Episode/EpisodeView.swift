//
//  EpisodeView.swift
//  Rick&Morty
//
//  Created by Георгий Матченко on 22.08.2022.
//

import Foundation
import UIKit

class Episode: UIView {

    private(set) lazy var backImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "RickAndMorty")
        view.contentMode = .scaleAspectFill
        return view
    }()

    private(set) lazy var tableView: UITableView = {
        let view = UITableView()
        view.register(CharacterCell.self, forCellReuseIdentifier: "cell")
//        view.register(HeaderEpisode.self, forHeaderFooterViewReuseIdentifier: "header")
        view.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: "header")
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
        addSubview(backImage)
        addSubview(tableView)
    }
    private func setViews() {
        setTableView()
        setBackgroundView()
    }

    private func setTableView() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.width.equalTo(safeAreaLayoutGuide)
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
