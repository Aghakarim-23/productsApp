//
//  ProfileViewController.swift
//  ProductsApp
//
//  Created by Agakerim Hemidzade on 24.07.26.
//

import SnapKit
import UIKit

class ProfileViewController: UIViewController {


    private var user = User(
        name: "Ağakərim",
        email: "aga@gmail.com",
        avatarColor: .systemBlue,
        theme: .light
    )
    
    // Profile Stack

    private let avatarView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 40
        return view
    }()

    private let avatarLabel: UILabel = {
        let label = UILabel()
        label.text = "A"
        label.font = .systemFont(ofSize: 36, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        return label
    }()

    private let emailLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .systemGray
        label.textAlignment = .center
        return label
    }()

    private let profileStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        return stackView
    }()

    // Settings Stack

    private let themeContainerView: UIView = {
        let themeContainer = UIView()
        themeContainer.backgroundColor = .secondarySystemBackground
        themeContainer.layer.cornerRadius = 12
        return themeContainer
    }()

    private let themeLabel: UILabel = {
        let label = UILabel()
        label.text = "Theme"
        label.textColor = .systemGray
        return label
    }()


    private let themeValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()

    private let avatarContainerView: UIView = {
        let avatarContainer = UIView()
        avatarContainer.backgroundColor = .secondarySystemBackground
        avatarContainer.layer.cornerRadius = 12
        return avatarContainer
    }()

    private let avatarColorLabel: UILabel = {
        let label = UILabel()
        label.text = "Avatar Color"
        label.textColor = .systemGray
        return label
    }()

    private let avatarStackValueView: UIStackView = {
        let themeStack = UIStackView()
        themeStack.axis = .horizontal
        themeStack.spacing = 8
        themeStack.alignment = .center
        return themeStack
    }()

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "circle.fill")
        imageView.tintColor = .systemBlue
        return imageView
    }()

    private let avatarValueLabel: UILabel = {
        let label = UILabel()
        label.text = "Blue"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()

    private let settingsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .fill
        return stackView
    }()

    private let editProfileButton: UIButton = {
        let button = UIButton()

        button.setTitle("Edit profile", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12

        return button
    }()
    

    @objc private func editProfile() {
        let editVC = EditProfileViewController(user: user)
        navigationController?.pushViewController(editVC, animated: true)
        print("Edit profile button tapped")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        setupUI()
    }

    private func setupUI() {
        title = "Profile"
        navigationController?.navigationBar.prefersLargeTitles = true

        addSubViews()
        addConstraints()
        configureUI()
        setupActions()
    }
    
    private func configureUI() {
        nameLabel.text = user.name
        emailLabel.text = user.email
        avatarView.backgroundColor = user.avatarColor
        avatarImageView.tintColor = user.avatarColor
        
        switch user.theme {
        case .light:
            themeValueLabel.text = "☀️ Light"
        case .dark:
            themeValueLabel.text = "🌙 Dark"

        }

        
    }

    private func addSubViews() {
        avatarView.addSubview(avatarLabel)
        profileStackView.addArrangedSubview(avatarView)
        profileStackView.addArrangedSubview(nameLabel)
        profileStackView.addArrangedSubview(emailLabel)

        view.addSubview(profileStackView)
        view.addSubview(settingsStackView)

        settingsStackView.addArrangedSubview(themeContainerView)
        themeContainerView.addSubview(themeLabel)
        themeContainerView.addSubview(themeValueLabel)

        settingsStackView.addArrangedSubview(avatarContainerView)
        avatarContainerView.addSubview(avatarColorLabel)
        avatarContainerView.addSubview(avatarStackValueView)
        avatarStackValueView.addArrangedSubview(avatarImageView)
        avatarStackValueView.addArrangedSubview(avatarValueLabel)

        view.addSubview(editProfileButton)
    }

    private func addConstraints() {
        profileStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.centerX.equalToSuperview()
        }

        avatarView.snp.makeConstraints { make in
            make.size.equalTo(80)
        }

        avatarLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        themeContainerView.snp.makeConstraints { make in
            make.height.equalTo(56)
        }

        themeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
        
        themeValueLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }

        avatarContainerView.snp.makeConstraints { make in
            make.height.equalTo(56)
        }

        avatarColorLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }

        avatarStackValueView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
        }

        settingsStackView.snp.makeConstraints { make in
            make.top.equalTo(profileStackView.snp.bottom).offset(24)
            make.horizontalEdges.equalToSuperview().inset(16)

        }

        editProfileButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
    }
    
    private func setupActions() {
        editProfileButton.addTarget(
             self,
             action: #selector(editProfile),
             for: .touchUpInside
         )
    }

}
