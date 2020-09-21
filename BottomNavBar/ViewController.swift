//
//  ViewController.swift
//  BottomNavBar
//
//  Created by macbook on 16/09/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var BoxingCollectionView: UICollectionView!
    @IBOutlet weak var BrandCollectionView: UICollectionView!
    @IBOutlet weak var SecondBanner: UICollectionView!
    @IBOutlet weak var IphoneCollection: UICollectionView!
    @IBOutlet weak var BestDealsCollection: UICollectionView!
    @IBOutlet weak var categoryCollection: UICollectionView!
    @IBOutlet weak var BannerCollection: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    //Model variable
    var categories = [Category]()
    var sections = [Sections]()
    var banners = [Banner]()
   var homeApi = HomeResponseApi()
    //Image Slider Variable
    
    var counter = 0
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        pageView.currentPage   = 0
        
        homeApi.getHomeResponse { (homeData) in
            if let homeData = homeData {
                self.categories = homeData.category!
               self.sections = homeData.sections!
                self.banners = homeData.banner!
                print(self.categories.count)
                // reload data from api and set to collection
                DispatchQueue.main.async {
                    self.categoryCollection.reloadData()
                    self.BestDealsCollection.reloadData()
                    self.IphoneCollection.reloadData()
                    self.BannerCollection.reloadData()
                    self.SecondBanner.reloadData()
                    self.BrandCollectionView.reloadData()
                    self.BoxingCollectionView.reloadData()

                    
                    self.timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
                    
                }
                
            }
        }
        
        
        
        
    }
    
    @objc func changeImage(){
        if counter < banners.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.BannerCollection.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageView.currentPage = counter
            counter += 1

        }
        else
        {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.BannerCollection.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            pageView.currentPage = counter
            counter = 1

        }

    }
    
    
    
}
extension ViewController:       UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      if collectionView == categoryCollection {
            print(categories.count)
            return categories.count
            
        }else if collectionView == BestDealsCollection{

            return sections.count

        }
        
      else if collectionView == IphoneCollection{

            return sections.count
        }
      else if collectionView == SecondBanner{
        
        return banners.count
      }
      else if collectionView == BrandCollectionView{
        
        return categories.count
        
      }else if collectionView == BoxingCollectionView{
        
        return categories.count
        
      }
        else {
            print(banners.count)
            pageView.numberOfPages = banners.count
            return banners.count


        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   if collectionView == categoryCollection {
            let cell = categoryCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoryCell
            cell.setUi(cat: categories[indexPath.row])
            
            return cell
        }
        else if  collectionView == BestDealsCollection{
            let cell = BestDealsCollection.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! BestDealsCell
            //print(sections[1].items![0])

            cell.setUi(sec: sections[1].items![0])

            return cell
        }
        else if collectionView == IphoneCollection{

            let cell = IphoneCollection.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as! IphoneCell
            //print(sections[1].items![0])

            cell.setUi(sec: sections[4].items![5])

            return cell

   } else if collectionView == SecondBanner {
    
    
        let cell = SecondBanner.dequeueReusableCell(withReuseIdentifier: "SecondBanner", for: indexPath)
        if let bannerVC = cell.viewWithTag(13) as? SecondBannerCell{
            
            
            bannerVC.setUi(ban: banners[indexPath.row])
            
        }
        
        return cell
        
   }else if collectionView == BrandCollectionView {
    let cell = BrandCollectionView.dequeueReusableCell(withReuseIdentifier: "brands", for: indexPath) as! BrandsCell
    cell.setUi(cat: categories[indexPath.row])
    
    return cell
    
    
   }
   else if collectionView == BoxingCollectionView {
    let cell = BoxingCollectionView.dequeueReusableCell(withReuseIdentifier: "boxing", for: indexPath) as! BoxingCell
    cell.setUi(cat: categories[indexPath.row])
    
    return cell
    
    
   }
   
        else
        {
            let cell = BannerCollection.dequeueReusableCell(withReuseIdentifier: "banner", for: indexPath)
            if let bannerVC = cell.viewWithTag(11) as? BannerCell{


                bannerVC.setUi(ban: banners[indexPath.row])

            }

            return cell

        }
    
}
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //        if collectionView == BestDealsCollection {
    //            let width = view.bounds.width
    //            let cellDimension = (width/5) - 3
    //            return CGSize(width: cellDimension, height: cellDimension)
    //        }
    //        return CGSize(width: 100.0, height: 100.0)
      }
    
    
    






