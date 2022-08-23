//
//  HeaderEpisode.swift
//  Rick&Morty
//
//  Created by Георгий Матченко on 23.08.2022.
//

import Foundation
import UIKit

class HeaderEpisode: UITableViewHeaderFooterView {
    private(set) lazy var titleEpisode: UILabel = {
        let view = UILabel()
        view.textColor = .red
        view.text = "SSSSSSSSS"
        view.backgroundColor = .blue
        return view
    }()

    private(set) lazy var idEpisode: UILabel = {
        let view = UILabel()
        view.textColor = .red
        view.backgroundColor = .blue
        return view
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addViews()
        setId()
        setTitle()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addViews()
        setId()
        setTitle()
    }

    private func addViews() {
        addSubview(titleEpisode)
        addSubview(idEpisode)
    }

    private func setId() {
        idEpisode.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.equalTo(safeAreaLayoutGuide).offset(20)
        }
    }

    private func setTitle() {
        idEpisode.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.equalTo(idEpisode.snp.trailing).offset(20)
        }
    }
}
