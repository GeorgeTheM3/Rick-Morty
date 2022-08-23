//
//  EpisodeVC.swift
//  Rick&Morty
//
//  Created by Георгий Матченко on 22.08.2022.
//

import Foundation
import UIKit

class EpisodeVC: UIViewController {
    private lazy var nameEpisode: String = ""
    private lazy var id: Int = 0
    private(set) var urlOfEpisode: String = ""

    private var episodeView: Episode {
        if let view = self.view as? Episode {
            return view
        }
        return Episode()
    }

    private func loadJSON(_ url: String) {
        NetworkManager.shared.fetchEpisodeData(url: url) { episode in
            DispatchQueue.main.async {
                self.nameEpisode = episode.name
                self.id = episode.id
                curentEpisodeCharactersUrls = episode.characters

                for item in curentEpisodeCharactersUrls {
                    NetworkManager.shared.fetchDataResult(url: item) { chareacter in
                        curentEpisodeCharacters.append(chareacter)
                        DispatchQueue.global(qos: .userInitiated).sync {
                            NetworkManager.shared.loadImages2(url: chareacter.image) {
                                DispatchQueue.main.async {
                                    self.episodeView.tableView.reloadData()
                                }
                            }
                        }
                    }
                }
                self.episodeView.tableView.reloadData()
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        loadJSON(urlOfEpisode)
    }

    override func viewDidDisappear(_ animated: Bool) {
        curentEpisodeCharacters.removeAll()
        curentEpisodeCharactersUrls.removeAll()
        curentEpisodeCharactersImage.removeAll()
    }

    override func loadView() {
        super.loadView()
        self.view = Episode()
        episodeView.tableView.dataSource = self
        episodeView.tableView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func setUrlEpisode(url: String) {
        urlOfEpisode = url
    }
}

extension EpisodeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        curentEpisodeCharacters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.backgroundColor = UIColor(white: 1, alpha: 0.6)
        guard let customCell = cell as? CharacterCell else { return cell}
        customCell.name.text = curentEpisodeCharacters[indexPath.row].name

        if curentEpisodeCharactersImage.count == curentEpisodeCharactersUrls.count {
            let image = UIImage(data: curentEpisodeCharactersImage[indexPath.row])
            customCell.image.image = image
            customCell.indicator.stopAnimating()
        }
        return customCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? HeaderEpisode {
//            view.titleEpisode.text = nameEpisode
//            view.idEpisode.text = String(id)
//            return view
//        }
//        return nil
        if let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? HeaderView {
            view.name.text = nameEpisode
            return view
        }
        return nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        80
    }
}

extension EpisodeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(nameEpisode)
        tableView.reloadData()
    }
}
