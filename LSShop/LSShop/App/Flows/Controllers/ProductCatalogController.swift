//
//  ProductCatalogController.swift
//  LSShop
//
//  Created by Станислав Лемешаев on 23.12.2020.
//

import UIKit

class ProductCatalogController: UIViewController {
    
    // MARK: - Properties
    private let tableView = UITableView()
    private static let reuseIdentifer = "ProductCatalogCell"
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    @objc func exitFromShop() {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .white
        
        configureNavigationBar()
        configureTableView()
        
        let image = UIImage(systemName: "pip.exit")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image,
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(exitFromShop))
    }
    
    func configureTableView() {
        tableView.backgroundColor = .white
        tableView.rowHeight = 80
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: ProductCatalogController.reuseIdentifer)
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.frame = view.frame
    }
    
    func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Каталог товаров"
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = true
        
        navigationController?.navigationBar.overrideUserInterfaceStyle = .dark
    }
}

// MARK: - UITableViewDelegate
extension ProductCatalogController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

// MARK: - UITableViewDataSource
extension ProductCatalogController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCatalogController.reuseIdentifer, for: indexPath)
        cell.textLabel?.text = "Товар \(indexPath.row)"
        return cell
    }
    
}

