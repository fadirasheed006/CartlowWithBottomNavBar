//
//  BoxingCell.swift
//  BottomNavBar
//
//  Created by macbook on 21/09/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit
import Kingfisher
class BoxingCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        img.layer.cornerRadius = 10
        img.clipsToBounds = true
        //catImg.layer.cornerRadius = catImg.frame.size.height * 0.1
        img.layer.borderWidth = 0.5
        img.layer.borderColor = UIColor.gray.cgColor
    }
    func setUi(cat:Category){
        
        img.kf.indicatorType = .activity
        img.kf.setImage(with: URL(string: cat.icon!), placeholder: nil, options:[.transition(.fade(0.7))], progressBlock: nil)
        
        
        
    }
}
