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
    private lazy var image = UIImage()

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
        infoView.tableView.delegate = self
    }
    func setImageCharacter(data: Data) {
//        infoView.imageCharacter.image = UIImage(data: data)
    }

    func getInfo(name: String, species: String, gender: String, origin: String, location: String) {
        self.name = name
        self.species = species
        self.gender = gender
        self.origin = origin
        self.location = location
    }
    func getImage(image: UIImage) {
        self.image = image
    }

    func setInfoView() {
        guard let view = infoView.tableView.tableHeaderView as? HeaderView else { return }
        view.name.text = name
        view.species.text = species
        view.gender.text = gender
        view.origin.text = origin
        view.location.text = location
        view.imageCharacter.image = image
    }
}

extension InfoVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows = 0
        for character in arrayOfCharacters where character.name == self.name {
            rows = character.episode.count
        }
        return rows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        guard let customCell = cell as? CustomInfoCell else { return cell}
        customCell.backgroundColor = UIColor(white: 1, alpha: 0.8)
        for character in arrayOfCharacters where character.name == self.name {
            customCell.name.text = character.episode[indexPath.row]
            customCell.id.text = String(indexPath.row + 1)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? HeaderView {
            view.imageCharacter.image = image
            view.name.text = name
            view.gender.text = gender
            view.species.text = species
            return view
        }
            return nil
    }
}

extension InfoVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        450
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = EpisodeVC()
        for character in arrayOfCharacters where character.name == self.name {
            controller.setUrlEpisode(url: character.episode[indexPath.row])
        }
        navigationController?.pushViewController(controller, animated: true)
    }
}
