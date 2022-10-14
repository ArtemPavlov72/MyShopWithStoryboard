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
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    //MARK: - Public Methods
    func configureCell(with product: Product) {
        productImageViewCell.fetchImage(from: product.image ?? "")
        productNameLabel.text = product.title
        productDescriptionLabel.text = product.description
        let price = String(format: "%.2f", Float(product.price ?? 0))
        productPriceLabel.text = "\(price)$"
    }
}
