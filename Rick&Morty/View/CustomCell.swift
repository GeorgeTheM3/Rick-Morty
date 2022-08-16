//
//  CustomCell.swift
//  Rick&Morty
//
//  Created by Георгий Матченко on 16.08.2022.
//

import Foundation
import UIKit
import SnapKit

class CustomCell: UITableViewCell {
    private(set) lazy var image: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    private(set) lazy var name: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        setImage()
        setName()
    }
    
    required init?(coder Decoder: NSCoder) {
        super.init(coder: Decoder)
        setViews()
        setImage()
        setName()
    }
    
//    override func awakeFromNib() {
//           super.awakeFromNib()
//       }
    
    func setViews() {
        addSubview(image)
        addSubview(name)
    }
    
    private func setImage() {
        image.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp_leadingMargin)
            make.height.equalTo(contentView.snp.height)
            make.width.equalTo(100)
        }
    }
    
    private func setName() {
        name.snp.makeConstraints { make in
            make.leading.equalTo(140)
            make.height.equalTo(contentView.safeAreaLayoutGuide)
        }
    }
}
