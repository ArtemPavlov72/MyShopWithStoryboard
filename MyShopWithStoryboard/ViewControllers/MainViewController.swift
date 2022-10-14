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
    private var headerPhotos: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        loadProducts(from: "https://fakestoreapi.com/products")
        loadSaleImages()
        productTableView.rowHeight = 250
        productTableView.delegate = self
        productTableView.dataSource = self
        headerCollectionView.delegate = self
        headerCollectionView.dataSource = self
    }
    
    private func loadProducts(from url: String) {
        NetworkManager.shared.fetchData(from: url) { result in
            switch result {
            case .success(let products):
                self.products = products
                self.productTableView.reloadData()
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
        headerPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = headerCollectionView.dequeueReusableCell(withReuseIdentifier: "saleCell", for: indexPath) as! HeaderCollectionViewCell
        let photo = headerPhotos[indexPath.item]
        cell.configureCell(saleImageName: photo)
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let paddingWidth: CGFloat = 20// * (numberOfItemsPerRow + 1)
//        let avaibleWidth = headerCollectionView.frame.width - paddingWidth
//        let widthPerItem = avaibleWidth
//        return CGSize(width: widthPerItem, height: widthPerItem)
//    }

}

