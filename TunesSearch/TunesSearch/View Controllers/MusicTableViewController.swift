//
//  MusicTableViewController.swift
//  TunesSearch
//
//  Created by Julian A. Fordyce on 6/2/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

private let reuseIdentifier = "MediaCell"

class MusicTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.register(MediaTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        setupTableView()
        searchResultsController.fetchMusicResults { (results) in
            guard let results = results else { return}
            DispatchQueue.main.async {
                self.results = results
                self.tableView.reloadData()
            }
        }
    }
    
  
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultsController.results.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MediaTableViewCell
        
        let test = searchResultsController.results[indexPath.row]
        cell.nameLabel.text = test.name
        cell.artistLabel.text = test.artistName
        cell.genreLabel.text = test.genres[0].name
        cell.releaseDateLabel.text = "Released on \(test.releaseDate)"
        
        guard let url = URL(string: test.artworkUrl100), let imageData = try? Data(contentsOf: url) else { return cell }
        
        cell.mediaImageView.image = UIImage(data: imageData)
        
        return cell
    }
    
    
    func setupTableView() {
        tableView.rowHeight = 120
    }
    
    
    // MARK: - Properties
    let searchResultsController = SearchResultsController()
    var results: [Result] = []

    
    
}
