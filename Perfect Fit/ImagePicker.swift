//
//  ImagePicker.swift
//  Perfect Fit
//
//  Created by Mohamed Amhar on 7/31/24.
//

import Foundation
import SwiftUI
import UIKit

/// A SwiftUI view for picking an image from the device's photo library or camera and saving its file path.
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImagePath: String?
    
    /// Creates and configures the UIImagePickerController.
    /// - Parameter context: The context in which the image picker will be displayed.
    /// - Returns: A configured UIImagePickerController instance.
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    /// Updates the UIImagePickerController when the view changes.
    /// - Parameters:
    ///   - uiViewController: The UIImagePickerController to update.
    ///   - context: The context for the update.
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    /// Creates a coordinator to manage the image picker.
    /// - Returns: A Coordinator instance for the image picker.
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    /// A coordinator that manages the image picker operations.
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        /// Initializes the coordinator with the parent ImagePicker.
        /// - Parameter parent: The parent ImagePicker.
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        /// Handles the selection of an image from the picker.
        /// - Parameters:
        ///   - picker: The image picker controller.
        ///   - info: A dictionary containing the selected media.
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                if let imagePath = saveImageToDocuments(image: image) {
                    parent.selectedImagePath = imagePath
                }
            }
            picker.dismiss(animated: true)
        }
        
        /// Saves the selected image to the app's documents directory and returns the file path.
        /// - Parameter image: The UIImage to save.
        /// - Returns: The file path of the saved image.
        func saveImageToDocuments(image: UIImage) -> String? {
            guard let data = image.jpegData(compressionQuality: 0.8) else { return nil }
            let filename = UUID().uuidString + ".jpg"
            let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(filename)
            
            do {
                try data.write(to: fileURL)
                return fileURL.path
            } catch {
                print("Error saving image: \(error)")
                return nil
            }
        }
    }
}
