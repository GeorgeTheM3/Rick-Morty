//
//  CustomInfoCell.swift
//  Rick&Morty
//
//  Created by Георгий Матченко on 21.08.2022.
//

import Foundation
import UIKit

class CustomInfoCell: UITableViewCell {
    private(set) lazy var id: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Al Nile", size: 20)
        return view
    }()
        private(set) lazy var name: UILabel = {
            let view = UILabel()
            view.font = UIFont(name: "AlNile-Bold", size: 16)
            view.backgroundColor = .black
            view.textColor = .white
            view.layer.cornerRadius = 5
            view.clipsToBounds = true
            view.textAlignment = .center
            return view
        }()

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setViews()
            setId()
            setName()
        }

        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setViews()
            setId()
            setName()
        }

        private func setViews() {
            addSubview(id)
            addSubview(name)
        }

        private func setId() {
            id.snp.makeConstraints { make in
                make.leading.equalTo(10)
                make.top.equalTo(5)
                make.bottom.equalTo(-5)
            }
        }

        private func setName() {
            name.snp.makeConstraints { make in
                make.top.equalTo(10)
                make.height.equalTo(25)
                make.trailing.equalTo(contentView.snp.trailing).offset(-10)
                make.leading.equalTo(id.snp.trailing).offset(10)
            }
        }
}
