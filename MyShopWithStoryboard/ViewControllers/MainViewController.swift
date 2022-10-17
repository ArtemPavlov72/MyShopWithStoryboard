//
//  ViewController.swift
//  MyShopWithStoryboard
//
//  Created by Artem Pavlov on 14.10.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var headerCollectionView: UICollectionView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var productTableView: UITableView!
    
    
    private var products: [Product] = []
    private var categories: [String] = []
    private var headerPhotos: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        loadProducts(from: Link.baseURL.rawValue)
        loadCategories(from: Link.categoryURL.rawValue)
        loadSaleImages()
        productTableView.rowHeight = 250
        productTableView.delegate = self
        productTableView.dataSource = self
        headerCollectionView.delegate = self
        headerCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }
    
    private func loadProducts(from url: String) {
        NetworkManager.shared.fetchData(dataType: Product.self, from: url) { result in
            switch result {
            case .success(let products):
                self.products = products
                self.productTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func loadCategories(from url: String) {
        NetworkManager.shared.fetchData(dataType: String.self, from: url) { result in
            switch result {
            case .success(let categories):
                self.categories = categories
                self.categoryCollectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func loadSaleImages() {
        headerPhotos = DataManager.shared.createSaleData()
    }
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductViewCell
        let product = products[indexPath.row]
        cell.configureCell(with: product)
        return cell
    }
}

// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == headerCollectionView {
            return headerPhotos.count
        } else {
            return categories.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == headerCollectionView {
            let productCell = headerCollectionView.dequeueReusableCell(withReuseIdentifier: "saleCell", for: indexPath) as! HeaderCollectionViewCell
        let photo = headerPhotos[indexPath.item]
        productCell.configureCell(saleImageName: photo)
            return productCell
        } else {
            let categoryCell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoriesCollectionViewCell
        let category = categories[indexPath.item]
            categoryCell.configureCell(category: category)
            return categoryCell
        }
    
    }
}

