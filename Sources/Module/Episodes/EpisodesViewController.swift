//
//  EpisodesVC.swift
//  Rick-and-Morty
//
//  Created by Maxim Maxim on 20.03.2024.
//

import UIKit

final class EpisodesViewController: UIViewController {
    // MARK: - Property
    private lazy var mainTitleIV = makeMainTitleIV()
    private lazy var magnifyIV = makeMagnifyIV()
    private lazy var filterButton = makeFilterButton()
    private lazy var contentView = makeContentView()
    private lazy var scrollView = makeScrollView()
    private lazy var collectionView = makeCollectionView()
    private lazy var activityIndicator = UIActivityIndicatorView()
    private var viewModel = EpisodesViewModel()
    private let finderTextField = FinderTextField(placeholder: "Name or episode (ex.S01E01)...")
    weak var characterViewControllerDelegate: CharacterViewControllerDelegate?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureUI()
        viewModel.getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    //    override func viewDidAppear(_ animated: Bool) {
    //        super.viewDidAppear(animated)
    //        viewModel.getData()
    //    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
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
        contentView.addSubview(activityIndicator)
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
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
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
            
            activityIndicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
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
    
    private func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self, let isLoading else { return }
            DispatchQueue.main.async {
                isLoading ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
            }
        }
    }
}

extension EpisodesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        characterViewControllerDelegate?.didPushCharacterVC()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return viewModel.dataSource?.count ?? 0
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodesCell.reuseIdentifier, for: indexPath) as? EpisodesCell else { return UICollectionViewCell() }
//        if let model = viewModel.dataSource?[indexPath.item] {
//            cell.configureCell(model: model)
//        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

#Preview {
    let vc = EpisodesViewController()
    return vc
}
