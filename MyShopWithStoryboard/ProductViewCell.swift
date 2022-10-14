//
//  ProductViewCell.swift
//  MyShopWithStoryboard
//
//  Created by Artem Pavlov on 14.10.2022.
//

import UIKit

class ProductViewCell: UITableViewCell {
    
    //MARK: - IB Outlets
    @IBOutlet weak var productImageViewCell: ProductImageView!

    //MARK: - Public Methods
    func configureCell(with product: Product) {
        productImageViewCell.fetchImage(from: product.image ?? "")
    }
}
