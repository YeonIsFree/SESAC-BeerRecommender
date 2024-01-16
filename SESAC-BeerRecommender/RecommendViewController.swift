//
//  RecommendViewController.swift
//  SESAC-BeerRecommender
//
//  Created by Seryun Chun on 2024/01/16.
//

import UIKit

class RecommendViewController: UIViewController {
    
    let manager = BeerManager()
    var beerList: [Beer] = []
    
    @IBOutlet var collectionView: UICollectionView!

     // MARK: - Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureFlowLayout()
        configureCollectionView()
        
        getBeerList()
    }
}

 // MARK: - Configure Methods

extension RecommendViewController {
    func getBeerList() {
        manager.callRequest { beers in
            self.beerList = beers
            self.beerList.remove(at: 0)
            self.collectionView.reloadData()
        }
    }
}

 // MARK: - UICollectionView Delegate

extension RecommendViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func configureFlowLayout() {
        let layout = UICollectionViewFlowLayout()
        let deviceWidth = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: deviceWidth, height: 700)
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        collectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return beerList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendCollectionViewCell.identifier, for: indexPath) as? RecommendCollectionViewCell else {
            return UICollectionViewCell() }
        
        cell.configureCell(beerList[indexPath.item])
        
        return cell
    }
}
