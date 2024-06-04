//
//  EpisodesCell.swift
//  Rick-and-Morty
//
//  Created by Maxim Maxim on 26.04.2024.
//

import UIKit

class EpisodesCell: UICollectionViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    private let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "GrayForCell")
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let leftItemImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "CellLeftItem")
        return imageView
    }()
    
    private let separationView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let heartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "UnfilledRedHeart"), for: .normal)
        return button
    }()
    
    private lazy var characterIV: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var characterNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private lazy var episodeNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    private lazy var episodeNumber: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(model: MockEpisodesModel) {
        characterIV.image = model.image
        characterNameLabel.text = model.characterName
        episodeNameLabel.text = model.episodeName
        episodeNumber.text = model.episodeNumber
    }
    
    func setupUI() {
        self.backgroundColor = .systemBackground
        self.addSubview(characterIV)
        self.addSubview(characterNameLabel)
        self.addSubview(bottomView)
        bottomView.addSubview(leftItemImage)
        bottomView.addSubview(episodeNameLabel)
        bottomView.addSubview(separationView)
        bottomView.addSubview(episodeNumber)
        bottomView.addSubview(heartButton)
    }
    
    func configureUI() {
        self.clipsToBounds = false
        self.layer.cornerRadius = 8
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 2
        
        characterIV.translatesAutoresizingMaskIntoConstraints = false
        characterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        leftItemImage.translatesAutoresizingMaskIntoConstraints = false
        episodeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        separationView.translatesAutoresizingMaskIntoConstraints = false
        episodeNumber.translatesAutoresizingMaskIntoConstraints = false
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            characterIV.heightAnchor.constraint(equalToConstant: 232),
            characterIV.widthAnchor.constraint(equalToConstant: 311),
            characterIV.topAnchor.constraint(equalTo: self.topAnchor),
            characterIV.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            characterNameLabel.topAnchor.constraint(equalTo: characterIV.bottomAnchor),
            characterNameLabel.bottomAnchor.constraint(equalTo: bottomView.topAnchor),
            characterNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            characterNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            
            bottomView.heightAnchor.constraint(equalToConstant: 71),
            bottomView.widthAnchor.constraint(equalTo: self.widthAnchor),
            bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            leftItemImage.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 20),
            leftItemImage.topAnchor.constraint(equalTo: bottomView.centerYAnchor, constant: -15),
            
            episodeNameLabel.leadingAnchor.constraint(equalTo: leftItemImage.trailingAnchor, constant: 15),
            episodeNameLabel.topAnchor.constraint(equalTo: bottomView.centerYAnchor, constant: -5),
            
            separationView.heightAnchor.constraint(equalToConstant: 23),
            separationView.widthAnchor.constraint(equalToConstant: 1),
            separationView.leadingAnchor.constraint(equalTo: episodeNameLabel.trailingAnchor, constant: 5),
            separationView.topAnchor.constraint(equalTo: bottomView.centerYAnchor, constant: -7),
            
            episodeNumber.leadingAnchor.constraint(equalTo: separationView.trailingAnchor, constant: 5),
            episodeNumber.topAnchor.constraint(equalTo: bottomView.centerYAnchor, constant: -5),
            
            heartButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -20),
            heartButton.topAnchor.constraint(equalTo: bottomView.centerYAnchor, constant: -15),
        ])
    }
}
