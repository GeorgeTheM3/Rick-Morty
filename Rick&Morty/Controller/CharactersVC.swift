//
//  CharactersVC.swift
//  Rick&Morty
//
//  Created by Георгий Матченко on 16.08.2022.
//

import Foundation

import UIKit

class CharactersVC: UIViewController {
    private var charectersView: CharactersView {
        guard let view = self.view as? CharactersView else { return CharactersView()}
        return view
    }
    override func loadView() {
        super.loadView()
        self.view = CharactersView()
        loadJSON(charactersURL)
    }

    private func loadJSON(_ url: String) {
        NetworkManager.shared.fetchData(url: url) { characters in
            DispatchQueue.main.async {
                nextPage = characters.info.next
                if let prev = characters.info.prev {
                    prevPage = prev
                }
                for item in characters.results {
                    arrayOfCharacters.append(item)
                }
                self.charectersView.tableView.reloadData()
            }
            DispatchQueue.global(qos: .userInitiated).async {
                for item in characters.results {
                    NetworkManager.shared.loadImages(url: item.image) {
                        DispatchQueue.main.async {
                            self.charectersView.tableView.reloadData()
                        }
                    }
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        charectersView.tableView.dataSource = self
        charectersView.tableView.delegate = self
//        charectersView.tableView.tableFooterView.nextButton.addTarget(self, action: #selector(nextButton), for: .touchUpInside)
//        charectersView.tableView.tableFooterView.backButton.addTarget(self, action: #selector(backButton), for: .touchUpInside)
    }
//        @objc func nextButton() {
//            arrayOfImage.removeAll()
//            arrayOfCharacters.removeAll()
//            loadJSON(nextPage)
//        }
//        @objc func backButton() {
//            arrayOfImage.removeAll()
//            arrayOfCharacters.removeAll()
//            loadJSON(prevPage)
//        }
}

extension CharactersVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfCharacters.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.backgroundColor = UIColor(white: 1, alpha: 0.6)
        guard let customCell = cell as? CharacterCell else { return cell}
            customCell.name.text = arrayOfCharacters[indexPath.row].name
            customCell.species.text = arrayOfCharacters[indexPath.row].species
            customCell.gender.text = arrayOfCharacters[indexPath.row].gender
            customCell.origin.text = "Origin:\(arrayOfCharacters[indexPath.row].origin.name)"
            customCell.location.text = "Location:\(arrayOfCharacters[indexPath.row].location.name)"
        if arrayOfImage.count == arrayOfCharacters.count {
            customCell.image.image = UIImage(data: arrayOfImage[indexPath.row])
            customCell.indicator.stopAnimating()
        }
        return customCell
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "footer") as? FooterView {
            return view
        }
            return nil
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        45
    }
}

extension CharactersVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = InfoVC()
        let name = arrayOfCharacters[indexPath.row].name
        let species = arrayOfCharacters[indexPath.row].species
        let gender = arrayOfCharacters[indexPath.row].gender
        let origin = arrayOfCharacters[indexPath.row].origin.name
        let location = arrayOfCharacters[indexPath.row].location.name

        if arrayOfImage.count == arrayOfCharacters.count {
            guard let image = UIImage(data: arrayOfImage[indexPath.row]) else { return }
            controller.getImage(image: image)
        }

        controller.getInfo(name: name, species: species, gender: gender, origin: origin, location: location)
        controller.setInfoView()
        navigationController?.pushViewController(controller, animated: true)
    }
}
