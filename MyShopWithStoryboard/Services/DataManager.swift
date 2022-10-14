//
//  DataManager.swift
//  MyShopWithStoryboard
//
//  Created by Артем Павлов on 14.10.2022.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    private init() {}
    
    func createSaleData() -> [String] {
        let salePhotos: [String] = ["sale1", "sale2", "sale3", "sale4", "sale5"]
        return salePhotos
    }
}
