
import Foundation

protocol CacheManagerProtocol: NSCache<NSString, NSData> {
    func getImageCached(from urlString: String,
                        with dependencies: DependenciesProtocol,
                        _ completion: @escaping(Result<NSData, Error>) -> Void)
}

final class CacheManager: NSCache<NSString, NSData>, CacheManagerProtocol {
    func getImageCached(from urlString: String,
                        with dependencies: DependenciesProtocol,
                        _ completion: @escaping(Result<NSData, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }

        if let cachedData = self.object(forKey: url.absoluteString as NSString) {
            completion(.success(cachedData))
            return
        }

        dependencies.networkService.fetchImage(from: urlString) { result in
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

//public enum CacheError: Error {
//    case urlIsNotValid
//    case failedToGetImage
//}
//
//protocol CacheManagerProtocol {
//    func getImageCached(from url: URL?,
//                        _ completion: @escaping(Result<KFCrossPlatformImage, Error>) -> Void)
//}
//
//final class CacheManager: CacheManagerProtocol {
//    private let cacheManager = KingfisherManager.shared
//
//    func getImageCached(from url: URL?,
//                        _ completion: @escaping (Result<KFCrossPlatformImage, Error>) -> Void) {
//        guard let url else {
//            completion(.failure(CacheError.urlIsNotValid))
//            return
//        }
//
//        cacheManager.retrieveImage(with: url) { result in
//            switch result {
//            case .success(let data):
//                completion(.success(data.image))
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
//}
