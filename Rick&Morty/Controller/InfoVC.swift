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
        guard let view = self.view as? InfoView else { return InfoView()}
        return view
    }

    override func loadView() {
        super.loadView()
        self.view = InfoView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        infoView.tableView.dataSource = self
        infoView.backgroundColor = .white
    }
    func setImageCharacter(data: Data) {
        infoView.imageCharacter.image = UIImage(data: data)
    }

    func getInfo(name: String, species: String, gender: String, origin: String, location: String) {
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

extension InfoVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        15
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        guard let cuastomCell = cell as? CustomCell else {return cell}
        cuastomCell.name.text = arrayOfCharacters[indexPath.row].name
        cuastomCell.indicator.startAnimating()
        return cuastomCell
    }
}
