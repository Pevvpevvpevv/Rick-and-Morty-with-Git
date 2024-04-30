//
//  EpisodesVC.swift
//  Rick-and-Morty
//
//  Created by Maxim Maxim on 20.03.2024.
//

import UIKit

final class EpisodesVC: UIViewController {
    // MARK: - Property
    private lazy var mainTitleIV = makeMainTitleIV()
    private lazy var magnifyIV = makeMagnifyIV()
    private lazy var filterButton = makeFilterButton()
    private lazy var contentView = makeContentView()
    private lazy var scrollView = makeScrollView()
    private lazy var collectionView = makeCollectionView()
    private var viewModel = MockEpisodesViewModel()
    fileprivate let finderTextField = FinderTextField(placeholder: "Name or episode (ex.S01E01)...")
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureUI()
    }
    
    //MARK: - Methods
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(mainTitleIV)
        view.addSubview(finderTextField)
        finderTextField.addSubview(magnifyIV)
        view.addSubview(filterButton)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(collectionView)
    }
    
    private func configureUI() {
        mainTitleIV.translatesAutoresizingMaskIntoConstraints = false
        finderTextField.translatesAutoresizingMaskIntoConstraints = false
        magnifyIV.translatesAutoresizingMaskIntoConstraints = false
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainTitleIV.heightAnchor.constraint(equalToConstant: 104),
            mainTitleIV.widthAnchor.constraint(equalToConstant: 312),
            mainTitleIV.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainTitleIV.topAnchor.constraint(equalTo: view.topAnchor, constant: 57),
            
            finderTextField.heightAnchor.constraint(equalToConstant: 56),
            finderTextField.widthAnchor.constraint(equalToConstant: 312),
            finderTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            finderTextField.topAnchor.constraint(equalTo: mainTitleIV.bottomAnchor, constant: 67),
            
            magnifyIV.centerYAnchor.constraint(equalTo: finderTextField.centerYAnchor),
            magnifyIV.leadingAnchor.constraint(equalTo: finderTextField.leadingAnchor, constant: 20),
            
            filterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            filterButton.topAnchor.constraint(equalTo: finderTextField.bottomAnchor, constant: 12),
            filterButton.heightAnchor.constraint(equalToConstant: 56),
            filterButton.widthAnchor.constraint(equalToConstant: 312),
            
            scrollView.topAnchor.constraint(equalTo: filterButton.bottomAnchor, constant: 25),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.widthAnchor.constraint(equalToConstant: 320),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.widthAnchor.constraint(equalToConstant: 320),
            contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            collectionView.widthAnchor.constraint(equalToConstant: 320),
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    private func makeMainTitleIV() -> UIImageView {
        let title = UIImageView()
        title.contentMode = .scaleToFill
        title.image = UIImage(named: "R&MLogo")
        title.backgroundColor = view.backgroundColor
        return title
    }
    
    private func makeMagnifyIV() -> UIImageView {
        let magnify = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        magnify.contentMode = .scaleToFill
        magnify.image = UIImage(systemName: "magnifyingglass")
        return magnify
    }
    
    private func makeFilterButton() -> UIButton {
        let button = UIButton()
        button.setTitle("ADVANCED FILTERS", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.titleLabel?.textAlignment = .center
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 40)
        button.setTitleColor(UIColor(named: "FilterButtonText"), for: .normal)
        button.backgroundColor = UIColor(named: "FilterButton")
        button.setImage(UIImage(named: "filterItem"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 100)
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 8
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 1)
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 2
        return button
    }
    
    private func makeContentView() -> UIView {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }
    
    private func makeScrollView() -> UIScrollView {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = true
        scroll.alwaysBounceVertical = true
        return scroll
    }
    
    private func makeCollectionView() -> UICollectionView {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
        collection.backgroundColor = .systemBackground
        collection.allowsSelection = true
        collection.register(EpisodesCell.self, forCellWithReuseIdentifier: EpisodesCell.reuseIdentifier)
        collection.dataSource = self
        collection.delegate = self
        return collection
    }
    
    private func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 50
        layout.itemSize = .init(width: 311, height: 357)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
        return layout
    }
}

fileprivate final class FinderTextField: UITextField {
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

extension EpisodesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodesCell.reuseIdentifier, for: indexPath) as? EpisodesCell else { return UICollectionViewCell() }
        cell.configureCell(model: viewModel.MockEpisodesContent[indexPath.item])
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.MockEpisodesContent.count
    }
}

#Preview {
    let vc = EpisodesVC()
    return vc
}
