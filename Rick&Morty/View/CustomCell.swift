//
//  CustomCell.swift
//  Rick&Morty
//
//  Created by Георгий Матченко on 16.08.2022.
//

import Foundation
import SnapKit
import UIKit

class CustomCell: UITableViewCell {
    private(set) lazy var image: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.layer.borderColor = CGColor(gray: 0, alpha: 1)
        view.layer.borderWidth = 2
        return view
    }()

    private(set) lazy var name: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "AlNile-Bold", size: 16)
        return lbl
    }()

    private(set) lazy var species: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Al Nile", size: 12)
        return lbl
    }()

    private(set) lazy var gender: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Al Nile", size: 12)
        return lbl
    }()

    private(set) lazy var origin: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Al Nile", size: 12)
        return lbl
    }()

    private(set) lazy var location: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Al Nile", size: 12)
        return lbl
    }()

    private(set) lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.isHidden = false
        indicator.startAnimating()
        indicator.hidesWhenStopped = true
        return indicator
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        setImage()
        setName()
        setSpecies()
        setGender()
        setOrigin()
        setLocation()
        setIndicator()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setViews()
        setImage()
        setName()
        setSpecies()
        setGender()
        setOrigin()
        setLocation()
        setIndicator()
    }

    private func setViews() {
        addSubview(image)
        addSubview(name)
        addSubview(species)
        addSubview(gender)
        addSubview(origin)
        addSubview(location)
        addSubview(indicator)
    }

    private func setImage() {
        image.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.top.equalTo(5)
            make.bottom.equalTo(-5)
            make.width.equalTo(110)
        }
    }

    private func setName() {
        name.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.leading.equalTo(image.snp.trailing).offset(10)
        }
    }

    private func setSpecies() {
        species.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom)
            make.leading.equalTo(image.snp.trailing).offset(10)
        }
    }

    private func setGender() {
        gender.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom)
            make.leading.equalTo(species.snp.trailing).offset(10)
        }
    }

    private func setOrigin() {
        origin.snp.makeConstraints { make in
            make.bottom.equalTo(location.snp.top)
            make.leading.equalTo(image.snp.trailing).offset(10)
        }
    }

    private func setLocation() {
        location.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottom).offset(-5)
            make.leading.equalTo(image.snp.trailing).offset(10)
        }
    }

    private func setIndicator() {
        indicator.snp.makeConstraints { make in
            make.center.equalTo(image.snp.center)
        }
    }
}
