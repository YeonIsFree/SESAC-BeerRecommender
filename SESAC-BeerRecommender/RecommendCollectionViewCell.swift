//
//  RecommendCollectionViewCell.swift
//  SESAC-BeerRecommender
//
//  Created by Seryun Chun on 2024/01/16.
//

import UIKit

class RecommendCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var recommendImageView: UIImageView!
    @IBOutlet var recommendNameLabel: UILabel!
    @IBOutlet var recommendDescriptionLabel: UILabel!
    
    func configureCell(_ beer: Beer) {
        if let imageUrl = URL(string: beer.image_url) {
            recommendImageView.kf.setImage(with: imageUrl)
        } else { return }
        
        recommendNameLabel.text = beer.name
        recommendDescriptionLabel.text = beer.description
    }
}
