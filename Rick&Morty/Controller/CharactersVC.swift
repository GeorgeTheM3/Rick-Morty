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
        return self.view as! CharactersView
    }
    
    override func loadView() {
        super.loadView()
        self.view = CharactersView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        charectersView.tableView.dataSource = self
        charectersView.tableView.delegate = self
        NetworkManager.shared.fetchData(url: charactersURL) { characters in
            DispatchQueue.main.async {
                for i in characters.results {
                    arrayOfPeople.append(i)
                }
                self.charectersView.tableView.reloadData()
            }
        }
    }
}

extension CharactersVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfPeople.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCell
        cell.name.text = arrayOfPeople[indexPath.row].name
        let imageURL = URL(string: arrayOfPeople[indexPath.row].image)
        guard let url = imageURL, let imageData = try? Data(contentsOf: url) else { return cell }
        DispatchQueue.main.async {
            cell.image.image = UIImage(data: imageData)
        }
        return cell
    }
}

extension CharactersVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}