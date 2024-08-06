
import Foundation

protocol UserDefaultsManagerProtocol {
    var userDefaults: UserDefaults { get }
    var didEnabledCameraKey: String { get }
    var didEnabledPhotoKey: String { get }
    
    func getFavouriteStatus(forKey: Int) -> Bool
    func setFavouriteStatus(forKey: Int, with status: Bool)
    func getDidEnabledCameraKey() -> Bool
    func setDidEnabledCameraKey(_ status: Bool)
    func getDidEnabledPhotoKey() -> Bool
    func setDidEnabledPhotoKey(_ status: Bool)
}

final class UserDefaultsManager: UserDefaultsManagerProtocol {
    let userDefaults = UserDefaults()
    let didEnabledCameraKey = "didEnabledCameraKey"
    let didEnabledPhotoKey = "didEnabledPhotoKey"
    
    func getFavouriteStatus(forKey: Int) -> Bool {
        userDefaults.bool(forKey: String(forKey))
    }
    
    func setFavouriteStatus(forKey: Int, with status: Bool) {
        userDefaults.setValue(status, forKey: String(forKey))
    }
    
    func getDidEnabledCameraKey() -> Bool {
        userDefaults.bool(forKey: didEnabledCameraKey)
    }
    
    func setDidEnabledCameraKey(_ status: Bool) {
        userDefaults.setValue(status, forKey: didEnabledCameraKey)
    }
    
    func getDidEnabledPhotoKey() -> Bool {
        userDefaults.bool(forKey: didEnabledPhotoKey)
    }
    
    func setDidEnabledPhotoKey(_ status: Bool) {
        userDefaults.setValue(status, forKey: didEnabledPhotoKey)
    }
}
