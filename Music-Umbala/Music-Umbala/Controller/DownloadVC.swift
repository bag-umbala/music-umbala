//
//  ThirdVC.swift
//  Music-Umbala
//
//  Created by Nam Nguyen on 6/14/17.
//  Copyright © 2017 Nam Vo. All rights reserved.
//

import UIKit

class DownloadVC: UIViewController, URLSessionDelegate, URLSessionDataDelegate {

    // MARK: *** Data model
    
    // MARK: *** Local variables
    var nameSong : String?
    var urlSong : String?
    var buffer:NSMutableData = NSMutableData()
    var session : URLSession?
    var dataTask:URLSessionDataTask?
    var expectedContentLength = 0
    var destinationUrl : URL = URL(fileURLWithPath: "")
    
    // MARK: *** UI Elements
    @IBOutlet weak var nameSongLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    
    // MARK: *** UI events
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
//    @IBAction func downloadButton(_ sender: UIButton) {
    func download() {
//        let url = URL(string: "http://j.ginggong.com/jDownload.ashx?id=ZWZFUFCB&h=mp3.zing.vn")
//        DispatchQueue.global().async {
//            do {
//                let data = try Data(contentsOf: url!)
//                DispatchQueue.global().sync {
//                    
//                }
//            } catch { // error as? NSError
//                print("error")
//            }
//        }
        nameSong = "test"
        nameSong = nameSong ?? "noname"
        urlSong = "http://j.ginggong.com/jDownload.ashx?id=ZWZFUFCB&h=mp3.zing.vn"
        
        if let audioUrl = URL(string: urlSong!) {
            
            // then lets create your document folder url
            let documentsDirectoryURL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            
            // lets create your destination file url
//            let destinationUrl = documentsDirectoryURL.appendingPathComponent("\(nameSong!).mp3")
            destinationUrl = documentsDirectoryURL.appendingPathComponent("\(nameSong!).mp3")
            print(destinationUrl)
            
            // to check if it exists before downloading it
            if FileManager.default.fileExists(atPath: destinationUrl.path) {
                print("The file already exists at path")
                
                // if the file doesn't exist
            } else {
                
                // you can use NSURLSession.sharedSession to download the data asynchronously
//                URLSession.shared.downloadTask(with: audioUrl, completionHandler: { (location, response, error) -> Void in
//                    guard let location = location, error == nil else { return }
//                    do {
//                        // after downloading your file you need to move it to your destination url
//                        try FileManager.default.moveItem(at: location, to: destinationUrl)
//                        print("File moved to documents folder")
//                    } catch let error as NSError {
//                        print(error.localizedDescription)
//                    }
//                }).resume()
                
                
                progress.progress = 0.0
                let configuration = URLSessionConfiguration.default
                let manqueue = OperationQueue.main
                session = URLSession(configuration: configuration, delegate:self, delegateQueue: manqueue)
                dataTask = session?.dataTask(with: URLRequest.init(url: audioUrl))
                dataTask?.resume()
//                session?.downloadTask(with: audioUrl, completionHandler: { (location, response, error) -> Void in
//                    guard let location = location, error == nil else { return }
//                    do {
//                        // after downloading your file you need to move it to your destination url
//                        try FileManager.default.moveItem(at: location, to: destinationUrl)
//                        print("File moved to documents folder")
//                    } catch let error as NSError {
//                        print(error.localizedDescription)
//                    }
//                }).resume()
            }
        }
    }
    
    // MARK: *** UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        download()
        progress.progress = 0.0
        nameSongLabel.text = nameSong
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        //here you can get full lenth of your content
        expectedContentLength = Int(response.expectedContentLength)
        print(expectedContentLength)
        completionHandler(URLSession.ResponseDisposition.allow)
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        buffer.append(data as Data)
        
        let percentageDownloaded = Float(buffer.length) / Float(expectedContentLength)
        progress.progress =  percentageDownloaded
        print(percentageDownloaded)
        percentLabel.text = "\(floor(percentageDownloaded) * 100)%"
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        //use buffer here.Download is done
        progress.progress = 1.0   // download 100% complete
        print("100%")
        percentLabel.text = "100%"
        do {
            // after downloading your file you need to move it to your destination url
//            try FileManager.default.moveItem(at: dataTask, to: destinationUrl)
            buffer.write(to: destinationUrl, atomically: true)
            print("File moved to documents folder")
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
