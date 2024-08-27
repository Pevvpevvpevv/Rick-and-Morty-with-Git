
import Foundation

protocol DependenciesProtocol {
    var moduleContainer: ModuleContainerProtocol { get }
    var networkService: NetworkServiceProtocol { get }
    var userDefaultsManager: UserDefaultsManagerProtocol { get }
    var cacheManager: CacheManagerProtocol { get }
    var imagePickerManager: ImagePickerManagerProtocol { get }
}

final class Dependencies: DependenciesProtocol {
    lazy var moduleContainer: ModuleContainerProtocol = ModuleContainer(self)
    lazy var networkService: NetworkServiceProtocol = NetworkService()
    lazy var userDefaultsManager: UserDefaultsManagerProtocol = UserDefaultsManager()
    lazy var cacheManager: CacheManagerProtocol = CacheManager()
    lazy var imagePickerManager: ImagePickerManagerProtocol = ImagePickerManager()
}
