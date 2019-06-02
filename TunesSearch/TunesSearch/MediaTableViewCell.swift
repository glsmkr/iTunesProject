//
//  MediaTableViewCell.swift
//  TunesSearch
//
//  Created by Julian A. Fordyce on 6/2/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

class MediaTableViewCell: UITableViewCell {

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        
        let constraints = [
                            mediaImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
                            mediaImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
                            mediaImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
                            mediaImageView.heightAnchor.constraint(equalToConstant: 100),
                            mediaImageView.widthAnchor.constraint(equalTo: mediaImageView.heightAnchor, multiplier: 1, constant: 0),
                            
                            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
                            nameLabel.leadingAnchor.constraint(equalTo: mediaImageView.trailingAnchor, constant: 16),
                            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
                            
                            artistLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
                            artistLabel.leadingAnchor.constraint(equalTo: mediaImageView.trailingAnchor, constant: 18),
                            artistLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
                            
                            genreLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 6),
                            genreLabel.leadingAnchor.constraint(equalTo: mediaImageView.trailingAnchor, constant: 16),
                            genreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
                            
                            releaseDateLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 6),
                            releaseDateLabel.leadingAnchor.constraint(equalTo: mediaImageView.trailingAnchor, constant: 16),
                            releaseDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
            
                        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 11)
        label.adjustsFontSizeToFitWidth = true
        return label
        
    }()
    
    let artistLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let genreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    
    let mediaImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 10
        iv.layer.masksToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    func setupViews() {
        addSubview(nameLabel)
        addSubview(releaseDateLabel)
        addSubview(artistLabel)
        addSubview(mediaImageView)
        addSubview(genreLabel)
    }
    

}
