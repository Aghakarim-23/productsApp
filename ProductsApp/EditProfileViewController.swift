//
//  EditProfileViewController.swift
//  ProductsApp
//
//  Created by Agakerim Hemidzade on 27.07.26.
//

import SnapKit
import UIKit

class EditProfileViewController: UIViewController {
    
    var user: User
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let themeContainerView: UIView = {
        let containerView = UIView()
        return containerView
    }()

    private let themeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "THEME"
        label.textColor = .systemGray
        return label
    }()

    private let categorySegmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["🌞 Light", "🌙 Dark"])

        control.selectedSegmentIndex = 0

        return control
    }()

    private let avatarContainerView: UIView = {
        let containerView = UIView()
        return containerView
    }()

    private let avatarTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "AVATAR COLOR"
        label.textColor = .systemGray
        return label
    }()

    private let colorsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 12
        stack.alignment = .center
        stack.distribution = .fillEqually
        return stack
    }()

    private let blueButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBlue
        button.setTitle("Blue", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        return button
    }()

    private let orangeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemOrange
        button.setTitle("Orange", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        return button
    }()

  
    private let greenButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGreen
        button.setTitle("Green", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        return button
    }()

    private let settingsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 20

        return stackView
    }()
    
    private let currentContainerValueView: UIView = {
        let container = UIView()
        container.backgroundColor = .systemGray6
        container.layer.cornerRadius = 12
        return container
    }()
    
    private let currentSelectionTitleLabel: UILabel = {
       let label  = UILabel()
        label.text = "Current selection"
        label.textColor = .systemGray
        return label
    }()

    private let currentThemeSettingsValueContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    private let currentThemeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Light"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    private let currentAvatarTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Blue"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()

    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(handleSave), for: .touchUpInside)
        return button
    }()

    @objc private func handleSave () {
        navigationController?.popViewController(animated: true)
        print("Handle save tapped")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(user)
        view.backgroundColor = .systemBackground
        setupUI()

    }

    private func setupUI() {

        title = "Edit"
        navigationController?.navigationBar.prefersLargeTitles = true

        let resetButton = UIBarButtonItem(
            title: "Reset",
            style: .plain,
            target: self,
            action: #selector(handleReset)
        )

        navigationItem.rightBarButtonItem = resetButton

        categorySegmentedControl.addTarget(
            self,
            action: #selector(categoryChanged),
            for: .valueChanged
        )

        addSubviews()
        addConstraints()
    }

    @objc private func categoryChanged() {
        print("category selected")
    }

    private func addSubviews() {
        view.addSubview(settingsStackView)
        settingsStackView.addArrangedSubview(themeContainerView)
        themeContainerView.addSubview(themeTitleLabel)
        themeContainerView.addSubview(categorySegmentedControl)

        settingsStackView.addArrangedSubview(avatarContainerView)
        avatarContainerView.addSubview(avatarTitleLabel)
        avatarContainerView.addSubview(colorsStackView)
        colorsStackView.addArrangedSubview(blueButton)
        colorsStackView.addArrangedSubview(greenButton)
        colorsStackView.addArrangedSubview(orangeButton)
        
        settingsStackView.addArrangedSubview(currentContainerValueView)
        currentContainerValueView.addSubview(currentSelectionTitleLabel)
        currentContainerValueView.addSubview(currentThemeSettingsValueContainer)
        currentThemeSettingsValueContainer.addArrangedSubview(currentThemeTitleLabel)
        currentThemeSettingsValueContainer.addArrangedSubview(currentAvatarTitleLabel)
        
        
        view.addSubview(saveButton)
    }

    private func addConstraints() {
        settingsStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.horizontalEdges.equalToSuperview().inset(16)
        }


        themeTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }

        categorySegmentedControl.snp.makeConstraints { make in
            make.top.equalTo(themeTitleLabel.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(40)
            make.bottom.equalToSuperview()

        }

        avatarTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }

        colorsStackView.snp.makeConstraints { make in
            make.top.equalTo(avatarTitleLabel.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()

        }

        blueButton.snp.makeConstraints { make in
            make.height.equalTo(44)
        }

        greenButton.snp.makeConstraints { make in
            make.height.equalTo(44)
        }

        orangeButton.snp.makeConstraints { make in
            make.height.equalTo(44)
        }

        currentContainerValueView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(60)
        }
        
        currentSelectionTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
        
        
        currentThemeSettingsValueContainer.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
        }
        
        
        saveButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }

    }

    @objc private func handleReset() {
        print("Reset button tapped")
    }

}
