//
//  ViewController.swift
//  SESAC-BeerRecommender
//
//  Created by Seryun Chun on 2024/01/16.
//

import UIKit
import Kingfisher

class BeerViewController: UIViewController {
    
    let manager = BeerManager()
    
    // MARK: - UI Properties
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var beerImageView: UIImageView!
    @IBOutlet var beerDescriptionLabel: UILabel!
    @IBOutlet var beerNameLabel: UILabel!
    
    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getBeerInfomation()
    }
}

// MARK: - Configure Methods

extension BeerViewController {
    func getBeerInfomation() {
        manager.callRequest { BeerList in
            let beer: Beer = BeerList[0]
            
            self.beerNameLabel.text = beer.name
            
            self.beerDescriptionLabel.text = beer.description
            
            if let imageUrl = URL(string: beer.image_url) {
                self.beerImageView.kf.setImage(with: imageUrl)
            } else { return }
        }
    }
}

