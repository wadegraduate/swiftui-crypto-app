//
//  LocalFileManager.swift
//  SwiftUICryptoProject
//
//  Created by Wadealanchan on 25/8/2023.
//

import Foundation
import SwiftUI

class LocalFileManager {
    
    static let instance = LocalFileManager()
    
    private init() {}
    
    func saveImageData(imageData: ImageData, imageName: String, folderName: String) {
        // create folder
        createFolderIfNeeded(folderName: folderName)
        
        //get path for image
        guard let url = getURLForImage(imageName: imageName, folderName: folderName) else { return }
        
        // save image to path
        do {
            try imageData.write(to: url)
        } catch let error {
            print("Error saving image. \(imageName). \(error)")
        }
    }
    
    func getImageData(imageName: String, folderName: String) -> ImageData? {
        guard let url = getURLForImage(imageName: imageName, folderName: folderName),
              FileManager.default.fileExists(atPath: url.path) else {
            return nil
        }
        do {
            return try Data(contentsOf: url)
        } catch {
            return nil
        }
    }
    
    private func createFolderIfNeeded(folderName: String) {
        guard let url = getURLForFolder(folderName: folderName) else { return }
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch let error {
                print("Error creating directory.  FolderName: \(folderName). \(error)")
            }
        }
    }
    
    private func getURLForFolder(folderName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil }
        return url.appendingPathComponent(folderName, conformingTo: .image)
    }
    
    private func getURLForImage(imageName: String, folderName: String) -> URL? {
        guard let folderURL = getURLForFolder(folderName: folderName) else { return nil }
        return folderURL.appendingPathComponent(imageName + ".png", conformingTo: .image)
    }
}

