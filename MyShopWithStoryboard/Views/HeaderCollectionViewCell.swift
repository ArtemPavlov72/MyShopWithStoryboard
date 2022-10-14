//
//  HeaderCollectionViewCell.swift
//  MyShopWithStoryboard
//
//  Created by Artem Pavlov on 14.10.2022.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var saleImage: UIImageView!
    
    func configureCell(saleImageName: String) {
        saleImage.image = UIImage(named: saleImageName)
        saleImage.layer.cornerRadius = 30
    }
}
