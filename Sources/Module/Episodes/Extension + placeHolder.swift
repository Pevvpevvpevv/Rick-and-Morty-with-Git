//
//  Extension + placeHolder.swift
//  Rick-and-Morty
//
//  Created by Maxim Maxim on 18.05.2024.
//

import UIKit

final class FinderTextField: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 20)
    
    init(placeholder: String) {
        super.init(frame: .zero)
        makeFinderTextField(placeholder: placeholder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    func makeFinderTextField(placeholder: String) {
        textColor = .darkGray
        tintColor = .darkGray
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
        attributedPlaceholder = NSAttributedString(string: placeholder)
    }
}
