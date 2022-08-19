//
//  FooterView.swift
//  Rick&Morty
//
//  Created by Георгий Матченко on 19.08.2022.
//

import Foundation
import UIKit

class FooterView: UIView {
    private(set) lazy var nextButton: UIButton = {
        let view = UIButton()
        view.setTitle("Next", for: .normal)
        view.backgroundColor = .black
        return view
    }()

    private(set) lazy var backButton: UIButton = {
        let view = UIButton()
        view.setTitle("Back", for: .normal)
        view.backgroundColor = .black
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setNextButton()
        setBackButton()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addViews()
        setNextButton()
        setBackButton()
    }

    private func addViews() {
        addSubview(nextButton)
        addSubview(backButton)
    }

    private func setNextButton() {
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.trailing.equalTo(-50)
            make.width.equalTo(100)
        }
    }
    private func setBackButton() {
        backButton.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.leading.equalTo(50)
            make.width.equalTo(100)
        }
    }
}
