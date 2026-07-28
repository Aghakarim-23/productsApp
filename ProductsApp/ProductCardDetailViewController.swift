//
//  ProductCardDetailViewController.swift
//  ProductsApp
//
//  Created by Agakerim Hemidzade on 25.07.26.
//

import SnapKit
import UIKit

final class ProductCardDetailViewController: UIViewController {

    let product: Product
    var onSelectProduct: ((Product) -> Void)?
 
    init(product: Product) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemBlue
        return imageView
    }()

    private let productTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()

    private let productDescription: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private let productPrice: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .systemGreen
        return label
    }()

    private let selectButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Select", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 12
        return btn
    }()

    private let productStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        addSubviews()
        addConstraints()

        selectButton.addTarget(
            self,
            action: #selector(onSelectTapped),
            for: .touchUpInside
        )

        configureData()

    }
    
    @objc private func onSelectTapped () {
        onSelectProduct?(product)
        navigationController?.popViewController(animated: true)
        
    }

    private func addSubviews() {
        view.addSubview(productStackView)
        [
            productImageView,
            productTitle,
            productDescription,
            productPrice,
            selectButton,
        ].forEach(productStackView.addArrangedSubview)
    }

    private func addConstraints() {

        productStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.horizontalEdges.equalToSuperview().inset(16)
        }

        productImageView.snp.makeConstraints { make in
            make.size.equalTo(48)
        }

        selectButton.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }

    private func configureData() {
        productImageView.image = UIImage(systemName: product.symbolName)
        productTitle.text = product.name
        productDescription.text = product.description
        productPrice.text = product.price
    }

}
