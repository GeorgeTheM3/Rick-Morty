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
        
        DispatchQueue.main.async {
            cell.name.text = arrayOfPeople[indexPath.row].name
            cell.species.text = arrayOfPeople[indexPath.row].species
            cell.gender.text = arrayOfPeople[indexPath.row].gender
            cell.origin.text = "Origin:\(arrayOfPeople[indexPath.row].origin.name)"
            cell.location.text = "Location:\(arrayOfPeople[indexPath.row].location.name)"
            
        let imageURL = URL(string: arrayOfPeople[indexPath.row].image)
        guard let url = imageURL, let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                cell.image.image = UIImage(data: imageData)
                cell.indicator.stopAnimating()
                cell.indicator.isHidden = true
            }
        }
        return cell
    }
}

extension CharactersVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}
