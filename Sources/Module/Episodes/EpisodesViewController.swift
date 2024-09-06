
import UIKit

final class EpisodesViewController: UIViewController {
    // MARK: - Property
    var viewModel: EpisodesViewModelProtocol? {
        didSet {
            viewModel?.fetchCharactersData {
                self.collectionView.reloadData()
            }
        }
    }
    
    weak var characterViewControllerDelegate: CharacterViewControllerDelegate?
    var isLoadingNewPage = false
    private lazy var mainTitleImageView = makeMainTitleImageView()
    private lazy var magnifyImageView = makeMagnifyImageView()
    private lazy var filterButton = makeFilterButton()
    private lazy var contentView = makeContentView()
    private lazy var scrollView = makeScrollView()
    private lazy var collectionView = makeCollectionView()
    private lazy var activityIndicator = UIActivityIndicatorView()
    private let finderTextField = FinderTextField(placeholder: "Name or episode (ex.S01E01)...")
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //MARK: - Methods
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(mainTitleImageView)
        view.addSubview(finderTextField)
        finderTextField.addSubview(magnifyImageView)
        view.addSubview(filterButton)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(activityIndicator)
        contentView.addSubview(collectionView)
    }
    
    private func configureUI() {
        mainTitleImageView.translatesAutoresizingMaskIntoConstraints = false
        finderTextField.translatesAutoresizingMaskIntoConstraints = false
        magnifyImageView.translatesAutoresizingMaskIntoConstraints = false
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainTitleImageView.heightAnchor.constraint(equalToConstant: 104),
            mainTitleImageView.widthAnchor.constraint(equalToConstant: 312),
            mainTitleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainTitleImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 57),
            
            finderTextField.heightAnchor.constraint(equalToConstant: 56),
            finderTextField.widthAnchor.constraint(equalToConstant: 312),
            finderTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            finderTextField.topAnchor.constraint(equalTo: mainTitleImageView.bottomAnchor, constant: 67),
            
            magnifyImageView.centerYAnchor.constraint(equalTo: finderTextField.centerYAnchor),
            magnifyImageView.leadingAnchor.constraint(equalTo: finderTextField.leadingAnchor, constant: 20),
            
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
    
    private func makeMainTitleImageView() -> UIImageView {
        let title = UIImageView()
        title.contentMode = .scaleToFill
        title.image = UIImage(named: "R&MLogo")
        title.backgroundColor = view.backgroundColor
        return title
    }
    
    private func makeMagnifyImageView() -> UIImageView {
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

//MARK: - CollectionView extension
extension EpisodesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let model = viewModel?.characters[indexPath.row] else { return }
        characterViewControllerDelegate?.didPushCharacterVC(model)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.characters.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodesCell.reuseIdentifier, for: indexPath) as? EpisodesCell,
            let model = viewModel?.characters[indexPath.row]
        else { return UICollectionViewCell() }
        
        cell.viewModel = viewModel
        cell.configure(model: .init(image: model.image, characterName: model.name, episodeName: model.episode[0], episodeNumber: model.episode[0], isFavourite: false, episodes: model.episode))
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        let scrollViewHeight = scrollView.contentSize.height
        let frameHeight = scrollView.frame.size.height
        let page = viewModel?.model
        let nextPage = page?.info.next
        
        guard page != nil,
              nextPage != nil,
              !isLoadingNewPage,
              offset >= (scrollViewHeight - frameHeight + 90)
        else { return }
        
        isLoadingNewPage = true
        viewModel?.fetchCharactersData {
            self.collectionView.reloadData()
        }
        
        self.isLoadingNewPage = false
    }
}


#Preview {
    let vc = EpisodesViewController()
    return vc
}
