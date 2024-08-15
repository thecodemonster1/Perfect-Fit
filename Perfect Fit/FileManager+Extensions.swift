//
//  FileManager+Extensions.swift
//  Perfect Fit
//
//  Created by Mohamed Amhar on 8/12/24.
//

import Foundation
import UIKit

extension FileManager {
    /// Saves the UIImage to the documents directory and returns the file path.
    /// - Parameter image: The UIImage to save.
    /// - Returns: The file path where the image is saved.
    static func saveImageToDocumentsDirectory(image: UIImage) -> String? {
        guard let data = image.jpegData(compressionQuality: 0.8) else { return nil }
        let filename = UUID().uuidString + ".jpg"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentsDirectory.appendingPathComponent(filename)
        
        do {
            try data.write(to: fileURL)
            return fileURL.path
        } catch {
            print("Error saving image: \(error)")
            return nil
        }
    }
}
