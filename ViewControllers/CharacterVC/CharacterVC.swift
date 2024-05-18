//
//  CharacterVC.swift
//  Rick-and-Morty
//
//  Created by Maxim Maxim on 20.03.2024.
//

import UIKit

final class CharacterVC: UIViewController {
    private lazy var characterButton = makeCharacterButton()
    private lazy var cameraButton = makeCameraButton()
    private lazy var nameLabel = makeNameLabel()
    private lazy var infoLabel = makeInfoLabel()
    private lazy var tableView = makeTableView()
    private var viewModel = MockCharacterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureUI()
        configureNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        characterButton.setImage(UIImage(named: "MockImage"), for: .normal)
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(characterButton)
        view.addSubview(cameraButton)
        view.addSubview(nameLabel)
        view.addSubview(infoLabel)
        view.addSubview(tableView)
    }
    
    private func configureUI() {
        characterButton.translatesAutoresizingMaskIntoConstraints = false
        cameraButton.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            characterButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 42),
            characterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            characterButton.heightAnchor.constraint(equalToConstant: 148),
            characterButton.widthAnchor.constraint(equalToConstant: 148),
            
            cameraButton.leadingAnchor.constraint(equalTo: characterButton.trailingAnchor, constant: 10),
            cameraButton.centerYAnchor.constraint(equalTo: characterButton.centerYAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: characterButton.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            infoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoLabel.widthAnchor.constraint(equalToConstant: 312),
            
            tableView.widthAnchor.constraint(equalToConstant: 312),
            tableView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 10),
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 360),
        ])
    }
    
    private func configureNavBar() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "GoBack"), style: .done, target: self, action: #selector(popToRoot))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "NavBarRightItem"), style: .plain, target: false, action: nil)
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 4)
        navigationController?.navigationBar.layer.masksToBounds = false
        navigationController?.navigationBar.layer.shadowRadius = 2.5
        navigationController?.navigationBar.layer.shadowOpacity = 0.15
        navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
    }
    
    @objc private func popToRoot() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func makeCharacterButton() -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = 74
        button.layer.borderWidth = 5
        button.layer.borderColor = UIColor.systemGray6.cgColor
        button.contentMode = .scaleAspectFill
        button.clipsToBounds = true
        return button
    }
    
    private func makeCameraButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = .systemBackground
        button.setImage(UIImage(named: "Camera"), for: .normal)
        return button
    }
    
    private func makeNameLabel() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Rick Sanchez"
        return label
    }
    
    private func makeInfoLabel() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .systemGray
        label.textAlignment = .left
        label.numberOfLines = 1
        label.text = "Informations"
        return label
    }
    
    private func makeTableView() -> UITableView {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 55
        tableView.allowsSelection = true
        tableView.backgroundColor = .systemBackground
        tableView.register(CharacterCell.self, forCellReuseIdentifier: CharacterCell.reuseIdentifier)
        return tableView
    }
}

extension CharacterVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.mockCharacterContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterCell.reuseIdentifier, for: indexPath) as? CharacterCell else { return UITableViewCell() }
        cell.setupCellUI()
        cell.configureCellUI()
        cell.configureCellViewModel(model: viewModel.mockCharacterContent[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

#Preview {
    let vc = CharacterVC()
    return vc
}
