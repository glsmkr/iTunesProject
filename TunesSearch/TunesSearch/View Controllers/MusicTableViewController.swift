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
        
        searchResultsController.fetchMusicFeed { (feed) in
            if let feed = feed {
                DispatchQueue.main.async {
                    self.navigationItem.title = "\(feed.title)"
                    
                }
            }
            
        }
        
        
    }
    
  
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultsController.results.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MediaTableViewCell
        
        let result = searchResultsController.results[indexPath.row]
        cell.nameLabel.text = result.name
        cell.artistLabel.text = result.artistName
        cell.genreLabel.text = result.genres[0].name
        cell.releaseDateLabel.text = "Released on \(result.releaseDate)"
       
        if let url = URL(string: result.artworkUrl100) {
            
            DispatchQueue.global().async {
                var image: UIImage? = nil
                if let imageData = try? Data(contentsOf: url) {
                    image = UIImage(data: imageData)
                }
                DispatchQueue.main.async {
                    cell.mediaImageView.image = image
                }
            }
        }
        
        return cell
    }
    
    
    func setupTableView() {
        tableView.rowHeight = 120
    }
    
    
    // MARK: - Properties
    let searchResultsController = SearchResultsController()
    var results: [Result] = []

    
    
}
