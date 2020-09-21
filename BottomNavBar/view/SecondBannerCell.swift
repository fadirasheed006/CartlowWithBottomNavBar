//
//  SecondBannerCell.swift
//  BottomNavBar
//
//  Created by macbook on 21/09/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit
import  Kingfisher
class SecondBannerCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    
    func setUi(ban:Banner){
        
        img.kf.indicatorType = .activity
        img.kf.setImage(with: URL(string: ban.image!), placeholder: nil, options:[.transition(.fade(0.7))], progressBlock: nil)
        
        
        
    }
}
