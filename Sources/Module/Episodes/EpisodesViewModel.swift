
import UIKit

protocol EpisodesViewModelProtocol {
    var networkEpisodes: [CharactersResult]? { get set }
    func fetchCharactersData(completion: @escaping() -> Void)
    func fetchEpisodeNumbers(completion: @escaping() -> Void)
    func fetchCharacterImage(completion: @escaping() -> Void)
}

final class EpisodesViewModel {
    var networkEpisodes: [CharactersResult]?
    private var model: Characters?
    private let networkService: NetworkServiceProtocol
    private let userDefaults: UserDefaultsManagerProtocol
    
    required init(_ dependencies: DependenciesProtocol) {
        self.networkService = dependencies.networkService
        self.userDefaults = dependencies.userDefaultsManager
    }
}

extension EpisodesViewModel: EpisodesViewModelProtocol {
    func fetchCharactersData(completion: @escaping() -> Void) {
        let url: String = "https://rickandmortyapi.com/api/character"
        networkService.fetch(from: url) { (result: Result<Characters, NetworkError>) in
            switch result {
            case .success(let characters):
                self.model = characters
                self.networkEpisodes = characters.results
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchEpisodeNumbers(completion: @escaping () -> Void) {
        
    }
    
    func fetchCharacterImage(completion: @escaping () -> Void) {
        
    }
}
