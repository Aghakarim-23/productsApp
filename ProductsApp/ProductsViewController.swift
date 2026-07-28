//
//  ProductsViewController.swift
//  ProductsApp
//
//  Created by Agakerim Hemidzade on 24.07.26.
//

import SnapKit
import UIKit

class ProductsViewController: UIViewController {

    private let products: [Product] = [
        Product(
            name: "iPhone 16",
            description: "A clean product card built with UIKit and Snapkit.",
            price: "$999",
            symbolName: "iphone"
        ),
        Product(
            name: "Apple watch",
            description: "A clean product card built with UIKit and Snapkit.",
            price: "$399",
            symbolName: "applewatch"
        ),
        Product(
            name: "Macbook Air",
            description: "A clean product card built with UIKit and Snapkit.",
            price: "$1299",
            symbolName: "laptopcomputer"
        ),
    ]

    private var selectedProduct: Product {
        products[categorySegmentController.selectedSegmentIndex]
    }

    private let categorySegmentController: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Phone", "Watch", "Laptop"])
        control.selectedSegmentIndex = 0

        return control
    }()

    private let productCardView: ProductCardView = {
        let cardView = ProductCardView()

        return cardView
    }()
    
    private let selectedProductLabel: UILabel = {
      let label = UILabel()
        label.text = "Heleki product secilmeyib"
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }

    private func setupUI() {
        title = "Products"

        navigationController?.navigationBar.prefersLargeTitles = true

        let addBarButtonItem = UIBarButtonItem(
            image: .add,
            style: .plain,
            target: self,
            action: #selector(addTapped)
        )

        let editBarButton = UIBarButtonItem(
            title: "Edit",
            style: .prominent,
            target: self,
            action: #selector(editTapped)
        )
        
        

        navigationItem.rightBarButtonItems = [addBarButtonItem, editBarButton]

        navigationItem.leftBarButtonItem = .init(
            image: .remove,
            style: .plain,
            target: self,
            action: nil
        )

        productCardView.configure(with: selectedProduct)
        productCardView.onTap = {[weak self] in
            guard let self else {return}
            let detailVC = ProductCardDetailViewController(product: self.selectedProduct)
            detailVC.onSelectProduct = {[weak self] product in
                guard let self else {return}
                print("Selected product is:", product.name)
                selectedProductLabel.text = product.name
            }
            self.navigationController?.pushViewController(detailVC, animated: true)
        }

        addSubViews()
        addConstraints()

        categorySegmentController.addTarget(
            self,
            action: #selector(categoryChanged),
            for: .valueChanged
        )
    }

    @objc func addTapped() {
        let detailVC = ProductCardDetailViewController(product: selectedProduct)
        navigationController?.pushViewController(detailVC, animated: true)
    }

    @objc func editTapped() {
        print("Edit tapped")
    }

    @objc private func categoryChanged() {
        productCardView.configure(with: selectedProduct)
    }

    private func addSubViews() {
        view.addSubview(categorySegmentController)
        view.addSubview(productCardView)
        view.addSubview(selectedProductLabel)
    }

    private func addConstraints() {
        categorySegmentController.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.horizontalEdges.equalToSuperview().inset(16)
        }

        productCardView.snp.makeConstraints { make in
            make.top.equalTo(categorySegmentController.snp.bottom).offset(24)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        selectedProductLabel.snp.makeConstraints { make in
            make.top.equalTo(productCardView.snp.bottom).offset(24)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
    }
}
