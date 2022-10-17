//
//  Shop.swift
//  MyShopWithStoryboard
//
//  Created by Artem Pavlov on 14.10.2022.
//

import Foundation

struct Product: Codable {
    let id: Int?
    let title: String?
    let price: Float?
    let category: String?
    let description: String?
    let image: String?
}

struct Sale {
    let photo: String?
}

struct Category: Codable {
    let category: [String]
}

enum Link: String {
    case baseURL = "https://fakestoreapi.com/products"
    case categoryURL = "https://fakestoreapi.com/products/categories"
}
