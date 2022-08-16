//
//  InfoVC.swift
//  Rick&Morty
//
//  Created by Георгий Матченко on 16.08.2022.
//

import Foundation
import UIKit

class InfoVC: UIViewController {
    
    private lazy var name: String = ""
    private lazy var species: String = ""
    private lazy var gender: String = ""
    private lazy var origin: String = ""
    private lazy var location: String = ""
    
    private var infoView: InfoView {
        return self.view as! InfoView
    }
    
    override func loadView() {
        super.loadView()
        self.view = InfoView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoView.backgroundColor = .white
    }
    
    func setImageCharacter(data: Data) {
        infoView.imageCharacter.image = UIImage(data: data)
    }
    
    func getInfo(name: String, species: String, gender: String, origin: String, location: String){
        self.name = name
        self.species = species
        self.gender = gender
        self.origin = origin
        self.location = location
    }
    
    func setInfoView() {
        infoView.name.text = name
        infoView.species.text = species
        infoView.gender.text = gender
        infoView.origin.text = origin
        infoView.location.text = location
    }
}
