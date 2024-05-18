//
//  CharacterCell.swift
//  Rick-and-Morty
//
//  Created by Maxim Maxim on 12.05.2024.
//

import UIKit

final class CharacterCell: UITableViewCell {
    private lazy var titleLabel = makeTitleLabel()
    private lazy var descriptionLabel = makeDescriptionLabel()
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }
    
    private func makeDescriptionLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }
    
    func configureCellViewModel(model: MockCharacterModel) {
        titleLabel.text = model.cellTitle
        descriptionLabel.text = model.cellContent
    }
    
    func setupCellUI() {
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
    }
    
    func configureCellUI() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 9),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
        ])
    }
}
