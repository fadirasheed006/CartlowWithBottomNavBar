//
//  SearchVC.swift
//  BottomNavBar
//
//  Created by macbook on 22/09/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    var homeApi = HomeResponseApi()
    var sections = [Sections]()
    var items = [Items]()
    @IBOutlet weak var searchCollection: UICollectionView!
    override func viewDidLoad() {
        
        let width = (view.frame.size.width - 10) / 2
        
        let layout = searchCollection.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width) 
        
        super.viewDidLoad()
        homeApi.getHomeResponse { (homeData) in
            if let homeData = homeData {
            self.sections = homeData.sections!
              DispatchQueue.main.async {
                self.items = self.sections[0].items!
                self.searchCollection.reloadData()
                
                }
                
            }
    }
    
    }
    
    
}

extension SearchVC:UICollectionViewDelegate ,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(items.count)
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = searchCollection.dequeueReusableCell(withReuseIdentifier: "search", for: indexPath) as! SearchCell
       cell.setUi(cat: items[indexPath.row])
        
        return cell
    }
    
    
    
    
}
