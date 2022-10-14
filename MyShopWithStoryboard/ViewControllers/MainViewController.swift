//
//  ViewController.swift
//  MyShopWithStoryboard
//
//  Created by Artem Pavlov on 14.10.2022.
//

import UIKit

class MainViewController: UITableViewController {
    
    private var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        loadProducts(from: "https://fakestoreapi.com/products")
        tableView.rowHeight = 250
    }
    
    private func loadProducts(from url: String) {
        NetworkManager.shared.fetchData(from: url) { result in
            switch result {
            case .success(let products):
                self.products = products
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension MainViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductViewCell
        let product = products[indexPath.row]
        cell.configureCell(with: product)
        return cell
    }
}

