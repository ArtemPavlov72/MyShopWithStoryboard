//
//  CategoriesCollectionViewCell.swift
//  MyShopWithStoryboard
//
//  Created by Artem Pavlov on 14.10.2022.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    func configureCell(category: String) {
        categoryLabel.text = category
    }
}
