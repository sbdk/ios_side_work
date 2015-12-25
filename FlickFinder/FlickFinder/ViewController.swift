//
//  ViewController.swift
//  FlickFinder
//
//  Created by Li Yin on 12/21/15.
//  Copyright © 2015 Li Yin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let BASE_URL = "https://api.flickr.com/services/rest/"
    let METHOD_NAME = "flickr.photos.search"
    let API_KEY = "baf501fa38cbd65fdec2b2b1590ec3a8"
    let EXTRAS = "url_m"
    let SAFE_SEARCH = "1"
    let DATA_FORMAT = "json"
    let NO_JSON_CALLBACK = "1"
    

    @IBOutlet weak var AppName: UILabel!
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var imageTitle: UILabel!
    @IBOutlet weak var phraseTextField: UITextField!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var longitudeTextField: UITextField!

    
    func prepareTextField(textField: UITextField){
        
        textField.delegate = self
        textField.textAlignment = .Left
        
    }
    
    //var tapRecognizer: UITapGestureRecognizer? = nil
    
    
    @IBAction func searchByPhraseButton(sender: AnyObject) {
    
        dismissAnyVisibleKeyboards()
        resultImageView.image = nil
        imageTitle.text = nil
        
        let methodArguments = [
        
            "method": METHOD_NAME,
            "api_key": API_KEY,
            "text": self.phraseTextField.text!,
            "safe_search":SAFE_SEARCH,
            "extras": EXTRAS,
            "format": DATA_FORMAT,
            "nojsoncallback": NO_JSON_CALLBACK
        
        ]
        
        let session = NSURLSession.sharedSession()
        
        let urlString = BASE_URL + escapedParameters(methodArguments)
        let url = NSURL(string: urlString)!
        let request = NSURLRequest(URL: url)
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) in
        
                guard (error == nil) else {
                    print("there was an error with your request: \(error)")
                    return
                }
            
                guard let statusCode = (response as? NSHTTPURLResponse)?.statusCode where statusCode >= 200 && statusCode <= 299 else {
                    if let response = response as? NSHTTPURLResponse {
                    print("Your request returned an invalid response! Status code: \(response.statusCode)!")
                    } else if let response = response {
                    print("Your request returned an invalid response! Response: \(response)!")
                    } else {
                    print("Your request returned an invalid response!")
                    }
                    return
                }
            
            
                guard let data = data else {
                    print("No data was returned by the request!")
                    return
                }
            
            
                let parsedResult: AnyObject!
                do {
                    parsedResult = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
                    } catch {
                        parsedResult = nil
                        print("Cound not parse the data as JSON: '\(data)'")
                        return
                        
                    }

                guard let stat = parsedResult["stat"] as? String where stat == "ok" else {
                    print("Cannot find keys 'photo' in \(parsedResult)")
                    return
                }
            
                /*guard let photosDictionary = parsedResult["photos"] as? NSDictionary else {
                    print("Cannot find keys 'photos' in \(parsedResult)")
                    return
                } */
            
            
                if let photosDictionary = parsedResult["photos"] as? [String:AnyObject]{
                    
                    var totalPhotosVal = 0
                    if let totalPhotos = photosDictionary["total"] as? String {
                        totalPhotosVal = (totalPhotos as NSString).integerValue
                    }
                    
                    if totalPhotosVal > 0 {
                        if let photosArray = photosDictionary["photo"] as? [[String:AnyObject]]{
                            
                            let randomPhotoIndex = Int(arc4random_uniform(UInt32(photosArray.count)))
                            let photoDictionary = photosArray[randomPhotoIndex] as [String:AnyObject]
                            
                            let photoTitle = photoDictionary["title"] as? String
                            let imageUrlString = photoDictionary["url_m"] as? String
                            let imageURL = NSURL(string: imageUrlString!)
                            
                            if let imageData = NSData(contentsOfURL: imageURL!) {
                                dispatch_async(dispatch_get_main_queue(), {
                                    self.resultImageView.image = UIImage(data: imageData)
                                    self.imageTitle.text = photoTitle ?? "(Untitled)"
                                })
                            }  else {
                                print("Image does not exist at \(imageURL)")
                            }
                            
                        }
                    } else {
                        dispatch_async(dispatch_get_main_queue(), {
                            self.imageTitle.text = "No Photos Found. Search Again."
                            self.resultImageView.image = nil
                        })
                    }
              }
        }
        
        task.resume()
    
    }
    
    @IBAction func searchByLatLonButton(sender: AnyObject) {
        
        dismissAnyVisibleKeyboards()
        resultImageView.image = nil
        imageTitle.text = nil
        
        let methodArguments = [
            
            "method": METHOD_NAME,
            "api_key": API_KEY,
            "bbox": convertLatLongInfo(),
            "safe_search":SAFE_SEARCH,
            "extras": EXTRAS,
            "format": DATA_FORMAT,
            "nojsoncallback": NO_JSON_CALLBACK
            
        ]
        
        let session = NSURLSession.sharedSession()
        
        let urlString = BASE_URL + escapedParameters(methodArguments)
        let url = NSURL(string: urlString)!
        let request = NSURLRequest(URL: url)
        
        
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) in
            
            guard (error == nil) else {
                print("there was an error with your request: \(error)")
                return
            }
            
            guard let statusCode = (response as? NSHTTPURLResponse)?.statusCode where statusCode >= 200 && statusCode <= 299 else {
                if let response = response as? NSHTTPURLResponse {
                    print("Your request returned an invalid response! Status code: \(response.statusCode)!")
                } else if let response = response {
                    print("Your request returned an invalid response! Response: \(response)!")
                } else {
                    print("Your request returned an invalid response!")
                }
                return
            }
            
            
            guard let data = data else {
                print("No data was returned by the request!")
                return
            }
            
            
            let parsedResult: AnyObject!
            do {
                parsedResult = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
            } catch {
                parsedResult = nil
                print("Cound not parse the data as JSON: '\(data)'")
                return
                
            }
            
            guard let stat = parsedResult["stat"] as? String where stat == "ok" else {
                print("Cannot find keys 'photo' in \(parsedResult)")
                return
            }
            
            /*guard let photosDictionary = parsedResult["photos"] as? NSDictionary else {
            print("Cannot find keys 'photos' in \(parsedResult)")
            return
            } */
            
            
            if let photosDictionary = parsedResult["photos"] as? [String:AnyObject]{
                
                var totalPhotosVal = 0
                if let totalPhotos = photosDictionary["total"] as? String {
                    totalPhotosVal = (totalPhotos as NSString).integerValue
                }
                
                if totalPhotosVal > 0 {
                    if let photosArray = photosDictionary["photo"] as? [[String:AnyObject]]{
                        
                        let randomPhotoIndex = Int(arc4random_uniform(UInt32(photosArray.count)))
                        let photoDictionary = photosArray[randomPhotoIndex] as [String:AnyObject]
                        
                        let photoTitle = photoDictionary["title"] as? String
                        let imageUrlString = photoDictionary["url_m"] as? String
                        guard let imageURL = NSURL(string: imageUrlString!) else {
                            
                            print("error")
                            return
                        }
                        
                        if let imageData = NSData(contentsOfURL: imageURL) {
                            dispatch_async(dispatch_get_main_queue(), {
                                self.resultImageView.image = UIImage(data: imageData)
                                self.imageTitle.text = photoTitle ?? "(Untitled)"
                            })
                        }  else {
                            print("Image does not exist at \(imageURL)")
                        }
                        
                    }
                } else {
                    dispatch_async(dispatch_get_main_queue(), {
                        self.imageTitle.text = "No Photos Found. Search Again."
                        self.resultImageView.image = nil
                    })
                }
            }
        }
        
        task.resume()

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //addKeyboardDismissRecognizer()
        subscribeToKeyboarNotifications()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTextField(phraseTextField)
        prepareTextField(latitudeTextField)
        prepareTextField(longitudeTextField)
        
        //tapRecognizer = UITapGestureRecognizer(target: self, action: "handleSingleTap")
        //tapRecognizer?.numberOfTapsRequired = 1
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        //removeKeyboardDismissRecognizer()
        unsubscribeFromKeyboarNotifications()
    }
    
    func setUIEnable(enabled enabled: Bool) {
        
        imageTitle.enabled = enabled
        
    }
    
    //convert lat and long info into 4 sets of Int.
    func convertLatLongInfo() -> String {
        
        let minLat = Int(floor((latitudeTextField.text! as NSString).doubleValue))
        let maxLat = Int(ceil((latitudeTextField.text! as NSString).doubleValue))
        
        let minLong = Int(floor((longitudeTextField.text! as NSString).doubleValue))
        let maxLong = Int(ceil((longitudeTextField.text! as NSString).doubleValue))
        
        if (-90 ... 90 ~= minLat) && (-90 ... 90 ~= maxLat) && (-180 ... 180 ~= minLong) && (-180 ... 180 ~= maxLong) {
        
            return "\(minLong), \(minLat), \(maxLong), \(maxLat)"
        }
            
        else{
         
            return "-180,-90,180,90"
        }
    }
    
    /* Helper function: Given a dictionary of parameters, convert to a string for a url */
    func escapedParameters(parameters: [String : AnyObject]) -> String {
        
        var urlVars = [String]()
        
        for (key, value) in parameters {
            
            /* Make sure that it is a string value */
            let stringValue = "\(value)"
            
            /* Escape it */
            let escapedValue = stringValue.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
            
            /* Append it */
            urlVars += [key + "=" + "\(escapedValue!)"]
            
        }
        
        return (!urlVars.isEmpty ? "?" : "") + urlVars.joinWithSeparator("&")
    }
    
    //define view rise effect useing keyboard notification below:
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /*func addKeyboardDismissRecognizer() {
        view.addGestureRecognizer(tapRecognizer!)
    }
    
    func removeKeyboardDismissRecognizer() {
        view.removeGestureRecognizer(tapRecognizer!)
    }
    
    func handleSingleTap(recognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }*/
    
    
    func keyboardWillShow(notification: NSNotification) {
    
        if phraseTextField.isFirstResponder() || latitudeTextField.isFirstResponder() || longitudeTextField.isFirstResponder() {
            self.view.frame.origin.y = getKeyboardHeight(notification) * -1
        }
    }
    
    func keyboardWillHide(notifiction: NSNotification) {
        
        if phraseTextField.isFirstResponder() || latitudeTextField.isFirstResponder() || longitudeTextField.isFirstResponder(){
            self.view.frame.origin.y = 0
        }
    }
    
    func dismissAnyVisibleKeyboards() {
        if phraseTextField.isFirstResponder() || latitudeTextField.isFirstResponder() || longitudeTextField.isFirstResponder(){
            self.view.endEditing(true)
        }

    }
    
    func getKeyboardHeight(notification: NSNotification) -> CGFloat
    {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.CGRectValue().height
    }
  
    
    func subscribeToKeyboarNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func unsubscribeFromKeyboarNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name:
            UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name:
            UIKeyboardWillHideNotification, object: nil)
    }

}
