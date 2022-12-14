//
//  HeaderView.swift
//  Rick&Morty
//
//  Created by Георгий Матченко on 19.08.2022.
//

import Foundation
import UIKit

class HeaderView: UITableViewHeaderFooterView {
    private(set) lazy var imageCharacter: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.layer.borderColor = CGColor(gray: 0, alpha: 1)
        view.layer.borderWidth = 5
        return view
    }()

    private(set) lazy var name: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "AlNile-Bold", size: 40)
        view.clipsToBounds = true
        view.textColor = .white
        view.backgroundColor = .black
        view.textAlignment = .center
        view.layer.cornerRadius = 15
        return view
    }()

    private(set) lazy var species: UILabel = {
        let view = UILabel()
        view.clipsToBounds = true
        view.textColor = .white
        view.backgroundColor = .black
        view.textAlignment = .center
        view.layer.cornerRadius = 15
        view.font = UIFont(name: "AlNile-Bold", size: 20)
        return view
    }()

    private(set) lazy var gender: UILabel = {
        let view = UILabel()
        view.clipsToBounds = true
        view.textColor = .white
        view.backgroundColor = .black
        view.textAlignment = .center
        view.layer.cornerRadius = 15
        view.font = UIFont(name: "AlNile-Bold", size: 20)
        return view
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addViews()
        setImageCharacter()
        setName()
        setSpecies()
        setGender()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addViews()
        setImageCharacter()
        setName()
        setSpecies()
        setGender()
    }

    private func addViews() {
        addSubview(imageCharacter)
        addSubview(name)
        addSubview(species)
        addSubview(gender)
    }

    private func setImageCharacter() {
        imageCharacter.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
    }
    private func setName() {
        name.snp.makeConstraints { make in
            make.top.equalTo(imageCharacter.snp.bottom).offset(10)
            make.centerX.equalTo(imageCharacter.snp.centerX)
            make.leading.equalTo(contentScaleFactor).offset(10)
        }
    }
    private func setSpecies() {
        species.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(10)
            make.centerX.equalTo(name.snp.centerX)
            make.width.equalTo(150)
        }
    }
    private func setGender() {
        gender.snp.makeConstraints { make in
            make.top.equalTo(species.snp.bottom).offset(10)
            make.centerX.equalTo(species.snp.centerX)
            make.width.equalTo(150)
        }
    }

}
