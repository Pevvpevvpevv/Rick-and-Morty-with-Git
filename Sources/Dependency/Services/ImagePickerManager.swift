
import UIKit

protocol ImagePickerManagerProtocol: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func showLibraryForImagePicker(_ viewController: UIViewController)
    func showCameraForImagePicker(_ viewController: UIViewController)
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
}

final class ImagePickerManager: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var completion: ((UIImage) -> Void)?
}

extension ImagePickerManager: ImagePickerManagerProtocol {
    func showLibraryForImagePicker(_ viewController: UIViewController) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        viewController.present(imagePicker, animated: true)
    }
    
    func showCameraForImagePicker(_ viewController: UIViewController) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        viewController.present(imagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            self.completion?(image)
            picker.dismiss(animated: true)
        }
    }
}
