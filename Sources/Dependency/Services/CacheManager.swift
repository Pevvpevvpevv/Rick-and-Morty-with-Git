
import Foundation

protocol CacheManagerProtocol: NSCache<NSString, NSData> {
    func getImageCached(from urlString: String,
                        with service: NetworkServiceProtocol,
                        _ completion: @escaping(Result<NSData, Error>) -> Void)
}

final class CacheManager: NSCache<NSString, NSData>, CacheManagerProtocol {
    func getImageCached(from urlString: String,
                        with service: NetworkServiceProtocol,
                        _ completion: @escaping(Result<NSData, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }

        if let cachedData = self.object(forKey: url.absoluteString as NSString) {
            completion(.success(cachedData))
            return
        }

        service.fetchImage(from: urlString) { result in
            switch result {
            case .success(let imageData):
                self.setObject(NSData(data: imageData), forKey: url.absoluteString as NSString)
                completion(.success(NSData(data: imageData)))
            case .failure(let error):
                print(error)
            }
        }
    }
}
