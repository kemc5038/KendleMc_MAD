//
//  ViewController.swift
//  Lab4
//
//  Created by Kendle Mcdowell on 10/2/18.
//  Copyright © 2018 Kendle Mcdowell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var user = Favorite()
//    let filename = "favs.plist"
    //underscore denotes no external name
    @IBOutlet weak var bookLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var likeScale: UILabel!
    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
        bookLabel.text = user.favBook
        authorLabel.text = user.favAuthor
        likeScale.text = user.rating
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let fileURL = dataFileURL(filename)
//        if FileManager.default.fileExists(atPath: (fileURL?.path)!){
//            let url = fileURL!
//            do{
//                let data = try Data(contentsOf: url)
//                let decoder = PropertyListDecoder()
//                user = try decoder.decode(Favorite.self, from: data)
//                bookLabel.text=user.favBook
//                authorLabel.text=user.favAuthor
//                likeScale.text=user.rating
//            } catch{
//                print("no file")
//            }
//        }
//        else{
//            print("file does not exist")
//        }
//
//
//        let app = UIApplication.shared
//        NotificationCenter.default.addObserver(self, selector: #selector(self.applicationWillResignActive(_:)), name: Notification.Name.UIApplicationWillResignActive, object: app)
//        @objc func applicationWillResignActive(_notification: Notification){
//            let fileURL = dataFileURL(filename)
//            let encoder = PropertyListEncoder()
//            encoder.outputFormat = .xml
//            do{
//                let plistData = try encoder.encode(user)
//                try plistData.write(to: fileURL!)
//            } catch{
//                print("write error")
//            }
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func dataFileURL(_filename:String) -> URL?{
//        //returns array of URLS
//        let urls = FileManager.default.urls(for:.documentDirectory, in:.userDomainMask)
//        var url : URL?
//        //append file name to first item in array
//        url = urls.first?.appendingPathComponent(filename)
//        //return the URL of the data file or nil
//        return url
//    }


}

