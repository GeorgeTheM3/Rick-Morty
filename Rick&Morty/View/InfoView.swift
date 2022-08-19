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
    private(set) lazy var imageCharacter: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        return img
    }()

    private(set) lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.isHidden = false
        indicator.startAnimating()
        indicator.hidesWhenStopped = true
        return indicator
    }()

    private(set) lazy var name: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "AlNile-Bold", size: 40)
        return lbl
    }()

    private(set) lazy var species: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Al Nile", size: 14)
        return lbl
    }()

    private(set) lazy var gender: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Al Nile", size: 14)
        return lbl
    }()

    private(set) lazy var origin: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Al Nile", size: 20)
        return lbl
    }()

    private(set) lazy var location: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Al Nile", size: 20)
        return lbl
    }()

    private(set) lazy var tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .clear
        view.register(CustomCell.self, forCellReuseIdentifier: "cell")
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setImageCharacter()
        setName()
        setSpecies()
        setGender()
        setOrigin()
        setLocation()
        setTableView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setViews()
        setImageCharacter()
        setName()
        setSpecies()
        setGender()
        setOrigin()
        setLocation()
        setTableView()
    }

    private func setViews() {
        addSubview(imageCharacter)
        addSubview(indicator)
        addSubview(name)
        addSubview(species)
        addSubview(gender)
        addSubview(origin)
        addSubview(location)
        addSubview(tableView)
    }

    private func setImageCharacter() {
        imageCharacter.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(10)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
        }
    }

    private func setIndicator() {
        indicator.snp.makeConstraints { make in
            make.center.equalTo(imageCharacter.snp.center)
        }
    }

    private func setName() {
        name.snp.makeConstraints { make in
            make.top.equalTo(imageCharacter.snp.bottom).offset(10)
            make.centerX.equalTo(safeAreaLayoutGuide)
        }
    }

    private func setSpecies() {
        species.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(-10)
            make.centerX.equalTo(safeAreaLayoutGuide)
        }
    }

    private func setGender() {
        gender.snp.makeConstraints { make in
            make.top.equalTo(species.snp.bottom)
            make.centerX.equalTo(safeAreaLayoutGuide)
        }
    }

    private func setOrigin() {
        origin.snp.makeConstraints { make in
            make.top.equalTo(gender.snp.bottom)
            make.centerX.equalTo(safeAreaLayoutGuide)
        }
    }

    private func setLocation() {
        location.snp.makeConstraints { make in
            make.top.equalTo(origin.snp.bottom)
            make.centerX.equalTo(safeAreaLayoutGuide)
        }
    }

    private func setTableView() {
        tableView.snp.makeConstraints { make in
            make.width.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(location.snp.bottom).offset(15)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
}
