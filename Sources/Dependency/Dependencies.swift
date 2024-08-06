
import Foundation

protocol DependenciesProtocol {
    var moduleContainer: ModuleContainerProtocol { get }
    var networkService: NetworkServiceProtocol { get }
    var userDefaultsManager: UserDefaultsManagerProtocol { get }
    var imageCacheManager: ImageCacheManagerProtocol { get }
    var imagePickerManager: ImagePickerManagerProtocol { get }
}

final class Dependencies: DependenciesProtocol {
    lazy var moduleContainer: ModuleContainerProtocol = ModuleContainer(self)
    lazy var networkService: NetworkServiceProtocol = NetworkService()
    lazy var userDefaultsManager: UserDefaultsManagerProtocol = UserDefaultsManager()
    lazy var imageCacheManager: ImageCacheManagerProtocol = ImageCacheManager()
    lazy var imagePickerManager: ImagePickerManagerProtocol = ImagePickerManager()
}
