
import UIKit

protocol ImageCacheManagerProtocol: NSCache<NSString, NSData> {
    func getImageCached(from urlString: String,
                        with dependencies: DependenciesProtocol,
                        _ completion: @escaping(Result<NSData, Error>) -> Void)
}

final class ImageCacheManager: NSCache<NSString, NSData>, ImageCacheManagerProtocol {
    func getImageCached(from urlString: String,
                        with dependencies: DependenciesProtocol,
                        _ completion: @escaping(Result<NSData, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        if let cachedData = self.object(forKey: url.lastPathComponent as NSString) {
            completion(.success(cachedData))
            return
        }
        
        dependencies.networkService.fetchImage(from: urlString) { result in
            switch result {
            case .success(let imageData):
                self.setObject(NSData(data: imageData), forKey: url.lastPathComponent as NSString)
                completion(.success(NSData(data: imageData)))
            case .failure(let error):
                print(error)
            }
        }
    }
}
