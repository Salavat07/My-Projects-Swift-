//
//  ViewController.swift
//  FileManager practice
//
//  Created by Salavat on 01.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let fileManager = FileManager()
    let tempDirect = NSTemporaryDirectory()
    let fileName =  "customFile.txt"
    var folderPath = ""
    
    
    
    
    func validateCatalog() -> String? {
        do {
            let objectsInCatalog = try fileManager.contentsOfDirectory (atPath: tempDirect)
            
            let objects = objectsInCatalog
            
            if objects.count > 0 {
                if objects.first == fileName {
                    print ("customFile.txt found" )
                    return objects.first
                } else {
                    print ("There's no file you're interested in")
                    return nil
                }
            }
        }  catch let error as NSError {
            print (error)
        }
        return nil
    }
    
    @IBOutlet weak var label: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 30
        
 

        // путь к ссылке Info.plist
        let path = Bundle.main.path(forResource: "Info", ofType: "plist")
        
        guard let uPath = path else{
            return
        }
        print(uPath)
        
        label.text = uPath
    }
    
    
    @IBAction func button(_ sender: Any) {
        
        let filePath = (tempDirect as NSString).appendingPathComponent(fileName)
        let fileContent = "Some text here"
        
        do
        {
            try fileContent.write(toFile: filePath, atomically: true, encoding: String.Encoding.utf8)
            label.text = "File customFile.txt was successfully created and now it's located at \(filePath)"
        } catch let error as NSError {
            label.text = "Could't create file customFile.txt because of error: \(error)"
        }
    }
    
    
    @IBAction func checkTmp(_ sender: Any) {
        let filesCatalog = validateCatalog() ?? "Nothing"
        label.text = filesCatalog
    }
    
    @IBAction func createFolder(_ sender: Any) {
        let docsFolderPath = NSURL (fileURLWithPath:
                                        NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask,
                                                                            true) [0])
        
        let logPath = docsFolderPath.appendingPathComponent ("CustomFolder")
        
        guard let unwrLogPath = logPath else {
            return }
        
        do{
            try FileManager.default.createDirectory (atPath: unwrLogPath.path,
                                                     withIntermediateDirectories: true, attributes: nil)
            label.text = "\(unwrLogPath)"
        } catch let error as NSError {
            label.text = "Can't create a directory, \(error)"
        }
    }
    
    @IBAction func folderExistCheck(_ sender: Any) {
        let directories : [String] =
        NSSearchPathForDirectoriesInDomains(FileManager .SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask,true)
        
        if directories.count > 0 {
            let directory = directories[0] //Директория с документами
            folderPath = directory.appendingFormat ("/" + fileName)
            print ("Local path = \(folderPath)")
        }else {
            print ("Could not find local directory for this folder")
            return
        }
        
        if fileManager.fileExists (atPath: folderPath) {
            label.text = "Folder exists - \(folderPath)"
        }else {
            label.text = "Folder does not exist"
        }
    }
    
    
    @IBAction func readFileButtonAction(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let file = fileName
            let fileURL = dir.appendingPathComponent(file)
            //reading
            do{
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                label.text = text
            }catch{
                label.text = "can't read"
            }
        }
    }
    
    
    
    @IBAction func writeToFileBtn(_ sender: Any) {
        
        let someText = "Hello file!"
        
        if let dir = FileManager.default.urls (for:
                .documentDirectory, in:
                .userDomainMask).first{
            let fileURL = dir.appendingPathComponent (fileName)
            
            do {
                try someText.write(to: fileURL, atomically:
                                    false, encoding: .utf8)
                label.text = "'\(someText)' added to '\(fileName)'"
                
            }catch{
                label.text = "Unable to write"
            }
        }
    }
    
    @IBAction func removeFileBtn(_ sender: Any) {
        if let dir = FileManager.default.urls(for:
                .documentDirectory, in: .userDomainMask) .first{
            let removeFile = dir.appendingPathComponent(fileName)
            
            do {
                try fileManager.removeItem(at: removeFile)
            label.text = "\(fileName) was removed"
                }catch{
                    label.text = "Unable to remove"
                }
        }
    }
}
