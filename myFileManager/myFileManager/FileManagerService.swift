//
//  FileManagerService.swift
//  myFileManager
//
//  Created by DCS on 03/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation
class  FileManagerService {
    static func getDocDir() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print("Doc Dir: \(paths[0])")
        return paths[0]
    }
    /*static func getfilesname() -> () {
        var files = [String]()
    let fileManager = FileManager.default
    let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
    do {
    let fileURLs = try fileManager.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil)
        let fileNameWithExt = theURL?.lastPathComponent
        files.append(fileURLs?.lastPathComponent)
        
    // process files
    } catch {
    print("Error while enumerating files \(documentsURL.path): \(error.localizedDescription)")
    }
    }*/
    
    
}
