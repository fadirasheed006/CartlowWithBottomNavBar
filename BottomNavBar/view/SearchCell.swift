//
//  SearchCell.swift
//  BottomNavBar
//
//  Created by macbook on 22/09/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class SearchCell: UICollectionViewCell {
    
    @IBOutlet weak var searchImage: UIImageView!
    
    @IBOutlet weak var searchItemName: UILabel!
    
    @IBOutlet weak var itemDescription: UILabel!
    
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemCurrency: UILabel!
    
    
    @IBOutlet weak var itemMarketPrice: UILabel!
    
    @IBOutlet weak var itemDiscount: UILabel!
    
    func setUi(cat:Items){
        
        searchImage.kf.indicatorType = .activity
        searchImage.kf.setImage(with: URL(string: cat.image!), placeholder: nil, options:[.transition(.fade(0.7))], progressBlock: nil)
        
    itemDescription.text = cat.item_title
        
    itemPrice.text = String(cat.price!)
    itemCurrency.text = cat.currency!
    //itemMarketPrice.text = "SAR \(String(cat.market_price!))"
    itemDiscount.text  = "Save \(String(cat.discount_percentage!))%"
      
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string:"SAR \(String(cat.market_price!))")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
    
        itemMarketPrice.attributedText = attributeString
        
        
    }
    

    
}
