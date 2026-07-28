//
//  ProductCardView.swift
//  ProductsApp
//
//  Created by Agakerim Hemidzade on 24.07.26.
//

import SnapKit
import UIKit

class ProductCardView: UIView {
    
    var onTap: (() -> Void)?

    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemBlue
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .label
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .systemGreen
        return label
    }()

    private let textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .fill
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with product: Product) {
        productImageView.image = UIImage(systemName: product.symbolName)
        titleLabel.text = product.name
        descriptionLabel.text = product.description
        priceLabel.text = product.price
    }

    private func setupUI() {
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 16
        isUserInteractionEnabled = true
        addSubviews()
        addConstraints()

        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(handleTap)
        )
        
        addGestureRecognizer(tap)
    }
    
    @objc private func handleTap() {
        onTap?()
    }

    private func addSubviews() {
        self.addSubview(productImageView)
        self.addSubview(textStackView)

        [
            titleLabel,
            descriptionLabel,
            priceLabel,
        ].forEach(textStackView.addArrangedSubview)

    }

    private func addConstraints() {
        productImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(16)
            make.width.height.equalTo(80)
        }

        textStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalTo(productImageView.snp.trailing).offset(16)
            make.trailing.bottom.equalToSuperview().inset(16)
        }
    }

}
