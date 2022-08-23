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
        view.backgroundColor = .clear
        view.register(CharacterCell.self, forCellReuseIdentifier: "cell")
        return view
    }()

    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "rick")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private(set) lazy var nextButton: UIButton = {
        let view = UIButton()
        view.setTitle("Next", for: .normal)
        view.backgroundColor = .black
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()

    private(set) lazy var backButton: UIButton = {
        let view = UIButton()
        view.setTitle("Back", for: .normal)
        view.backgroundColor = .black
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
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
        addSubview(backgroundImage)
        addSubview(tableView)
        addSubview(backButton)
        addSubview(nextButton)
    }

    private func setViews() {
        setTableView()
        setBackground()
        setBackButton()
        setNextButton()
    }

    private func setTableView() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.width.equalTo(safeAreaLayoutGuide)
            make.bottom.equalTo(nextButton.snp.top).offset(-5)
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

    private func setNextButton() {
        nextButton.snp.makeConstraints { make in
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-20)
            make.width.equalTo(100)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }

    private func setBackButton() {
        backButton.snp.makeConstraints { make in
            make.leading.equalTo(safeAreaLayoutGuide).offset(20)
            make.width.equalTo(100)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
}
