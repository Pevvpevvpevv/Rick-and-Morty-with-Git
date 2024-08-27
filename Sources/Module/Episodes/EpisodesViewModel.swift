
import Foundation

protocol EpisodesViewModelProtocol {
    var characters: [CharactersResult]? { get set }
    func fetchCharactersData(completion: @escaping() -> Void)
    func fetchEpisodeName(_ url: String, completion: @escaping(Episode) -> Void)
    func getCharacterImage(from url: String, completion: @escaping(Data) -> Void)
}

final class EpisodesViewModel {
    var characters: [CharactersResult]?
    private var model: Characters?
    private let dependencies: DependenciesProtocol
    private let networkService: NetworkServiceProtocol
    private let userDefaults: UserDefaultsManagerProtocol
    private let cacheManager: CacheManagerProtocol
    
    required init(_ dependencies: DependenciesProtocol) {
        self.dependencies = dependencies
        self.networkService = dependencies.networkService
        self.userDefaults = dependencies.userDefaultsManager
        self.cacheManager = dependencies.cacheManager
    }
}

extension EpisodesViewModel: EpisodesViewModelProtocol {
    func fetchCharactersData(completion: @escaping() -> Void) {
        let url: String = "https://rickandmortyapi.com/api/character"
        networkService.fetch(from: url) { (result: Result<Characters, NetworkError>) in
            switch result {
            case .success(let page):
                self.model = page
                self.characters = page.results
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchEpisodeName(_ url: String, completion: @escaping (Episode) -> Void) {
        networkService.fetch(from: url) { (result: Result<Episode, NetworkError>) in
            switch result {
            case .success(let episode):
                completion(episode)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getCharacterImage(from url: String, completion: @escaping (Data) -> Void) {
        guard let commonModel = characters else { return }
        
        cacheManager.getImageCached(from: url, with: dependencies) { result in
            switch result {
            case .success(let cachedImageData):
                completion(Data(cachedImageData))
            case .failure(let error):
                print(error)
            }
        }
    }
}
