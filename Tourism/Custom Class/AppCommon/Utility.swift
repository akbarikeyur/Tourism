//
//  Utility.swift
//  Cozy Up
//
//  Created by Amisha on 15/10/18.
//  Copyright © 2018 Amisha. All rights reserved.
//

import UIKit
import Toaster
import AVFoundation
import SafariServices
import AVKit
import SDWebImage

struct PLATFORM {
    static var isSimulator: Bool {
        return TARGET_OS_SIMULATOR != 0
    }
}

//MARK:- Image Function
func compressImage(_ image: UIImage, to toSize: CGSize) -> UIImage {
    var actualHeight: Float = Float(image.size.height)
    var actualWidth: Float = Float(image.size.width)
    let maxHeight: Float = Float(toSize.height)
    //600.0;
    let maxWidth: Float = Float(toSize.width)
    //800.0;
    var imgRatio: Float = actualWidth / actualHeight
    let maxRatio: Float = maxWidth / maxHeight
    //50 percent compression
    if actualHeight > maxHeight || actualWidth > maxWidth {
        if imgRatio < maxRatio {
            //adjust width according to maxHeight
            imgRatio = maxHeight / actualHeight
            actualWidth = imgRatio * actualWidth
            actualHeight = maxHeight
        }
        else if imgRatio > maxRatio {
            //adjust height according to maxWidth
            imgRatio = maxWidth / actualWidth
            actualHeight = imgRatio * actualHeight
            actualWidth = maxWidth
        }
        else {
            actualHeight = maxHeight
            actualWidth = maxWidth
        }
    }
    let rect = CGRect(x: CGFloat(0.0), y: CGFloat(0.0), width: CGFloat(actualWidth), height: CGFloat(actualHeight))
    UIGraphicsBeginImageContext(rect.size)
    image.draw(in: rect)
    let img: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
    let imageData1: Data? = img?.jpegData(compressionQuality: 1.0)//UIImageJPEGRepresentation(img!, CGFloat(1.0))//UIImage.jpegData(img!)
    UIGraphicsEndImageContext()
    return  imageData1 == nil ? image : UIImage(data: imageData1!)!
}


//MARK:- UI Function
func getTableBackgroundViewForNoData(_ str:String, size:CGSize) -> UIView {
    let noDataLabel: UILabel     = UILabel(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
    noDataLabel.text          = str.decoded
    noDataLabel.textColor     = ColorType.DarkGray.value
    //noDataLabel.font          = Regular18Font
    noDataLabel.textAlignment = .center
    return noDataLabel
}
func showCreditFormattedStr(_ credit:Int?) -> String{
    if(credit == nil){
        return "$0"
    }
    else{
        return "$" + String(credit!)
    }
}

func showEmailFormattedStr(_ str:String) -> String{
    let  arr:[String] = str.components(separatedBy: "@")
    if(arr.count == 2){
        if(arr[0].count > 2){
            return arr[0][0] + "***" + arr[0][arr[0].count-1] + arr[1]
        }
        else{
            return str
        }
    }
    return str
}

//MARK:- Toast
func displayToast(_ message:String)
{
   // showAlert("", message: NSLocalizedString(message, comment: ""),completion: {
   // })
    let toast = Toast(text: NSLocalizedString(message, comment: ""))
    toast.show()
}

func showLoader()
{
    AppDelegate().sharedDelegate().showLoader()
}
func removeLoader()
{
    AppDelegate().sharedDelegate().removeLoader()
}
func showAlertWithOption(_ title:String, message:String, btns:[String] = ["No","Yes"],completionConfirm: @escaping () -> Void,completionCancel: @escaping () -> Void){
    let myAlert = UIAlertController(title:NSLocalizedString(title, comment: ""), message:NSLocalizedString(message, comment: ""), preferredStyle: UIAlertController.Style.alert)
    let rightBtn = UIAlertAction(title: btns[0], style: UIAlertAction.Style.cancel, handler: { (action) in
        completionCancel()
    })
    let leftBtn = UIAlertAction(title: btns[1], style: UIAlertAction.Style.default, handler: { (action) in
        completionConfirm()
    })
    myAlert.addAction(rightBtn)
    myAlert.addAction(leftBtn)
    AppDelegate().sharedDelegate().window?.rootViewController?.present(myAlert, animated: true, completion: nil)
}

func showAlert(_ title:String, message:String, completion: @escaping () -> Void) {
    let myAlert = UIAlertController(title:NSLocalizedString(title, comment: ""), message:NSLocalizedString(message, comment: ""), preferredStyle: UIAlertController.Style.alert)
    let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler:{ (action) in
        completion()
    })
    myAlert.addAction(okAction)
    AppDelegate().sharedDelegate().window?.rootViewController?.present(myAlert, animated: true, completion: nil)
}

func displaySubViewtoParentView(_ parentview: UIView! , subview: UIView!)
{
    subview.translatesAutoresizingMaskIntoConstraints = false
    parentview.addSubview(subview);
    parentview.addConstraint(NSLayoutConstraint(item: subview!, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: parentview, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant: 0.0))
    parentview.addConstraint(NSLayoutConstraint(item: subview!, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: parentview, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1.0, constant: 0.0))
    parentview.addConstraint(NSLayoutConstraint(item: subview!, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: parentview, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: 0.0))
    parentview.addConstraint(NSLayoutConstraint(item: subview!, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: parentview, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1.0, constant: 0.0))
    parentview.layoutIfNeeded()
}

func displaySubViewWithScaleOutAnim(_ view:UIView) {
    view.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
    view.alpha = 1
    UIView.animate(withDuration: 0.35, delay: 0.0, usingSpringWithDamping: 0.55, initialSpringVelocity: 1.0, options: [], animations: {() -> Void in
        view.transform = CGAffineTransform.identity
    }, completion: {(_ finished: Bool) -> Void in
    })
}
func displaySubViewWithScaleInAnim(_ view:UIView) {
    UIView.animate(withDuration: 0.25, animations: {() -> Void in
        view.transform = CGAffineTransform(scaleX: 0.65, y: 0.65)
        view.alpha = 0.0
    }, completion: {(_ finished: Bool) -> Void in
        view.removeFromSuperview()
    })
}

func isValidGStNumber(testStr:String) -> Bool {
    let emailRegEx = "^([0]{1}[1-9]{1}|[1-2]{1}[0-9]{1}|[3]{1}[0-7]{1})([a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}[1-9a-zA-Z]{1}[zZ]{1}[0-9a-zA-Z]{1})+$"
    
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: testStr)
}

func isValidateMobileNumber(value: String) -> Bool {
    let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
    let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
    let result =  phoneTest.evaluate(with: value)
    return result
}

//MARK:- Open Url
func openUrlInSafari(strUrl : String)
{
    var newStrUrl = strUrl
    if !newStrUrl.contains("http://") && !newStrUrl.contains("https://") {
        newStrUrl = "http://" + strUrl
    }
    if let url = URL(string: newStrUrl) {
        if UIApplication.shared.canOpenURL(url) {
            if #available(iOS 11.0, *) {
                let config = SFSafariViewController.Configuration()
                config.entersReaderIfAvailable = true
                let vc = SFSafariViewController(url: url, configuration: config)
                UIApplication.topViewController()!.present(vc, animated: true)
            } else {
                // Fallback on earlier versions
                UIApplication.shared.open(url, options: [:]) { (isOpen) in
                    print(isOpen)
                }
            }
        }
    }
}

//MARK:- Color function
func colorFromHex(hex : String) -> UIColor
{
    return colorWithHexString(hex, alpha: 1.0)
}

func colorFromHex(hex : String, alpha:CGFloat) -> UIColor
{
    return colorWithHexString(hex, alpha: alpha)
}

func colorWithHexString(_ stringToConvert:String, alpha:CGFloat) -> UIColor {
    
    var cString:String = stringToConvert.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: alpha
    )
}

func imageFromColor(color: UIColor) -> UIImage {
    let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    context?.setFillColor(color.cgColor)
    context?.fill(rect)
    
    let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return image!
}

//MARK : - Add Credit Card
func showCardNumberFormattedStr(_ str:String, isRedacted:Bool = true) -> String{

    let tempStr:String = sendDetailByRemovingChar(sendDetailByRemovingChar(str, char:"-"), char: " ")
    var retStr:String = ""
    for i in 0..<tempStr.count{
        if(i == 4 || i == 8 || i == 12){
            retStr += "-"
        }
        retStr += tempStr[i]
    }
    if(isRedacted){
        var arr:[String] = retStr.components(separatedBy: "-")
        for i in 0..<arr.count{
            if(i == 1 || i == 2){
                arr[i] = "xxxx"
            }
        }
        retStr = arr.joined(separator: "-")
    }
    return retStr
}
func showCardExpDateFormattedStr(_ str:String) -> String{

    let tempStr:String = sendDetailByRemovingChar(str, char:"/")
    var retStr:String = ""
    for i in 0..<tempStr.count{
        if(i == 2){
            retStr += "/"
        }
        retStr += tempStr[i]
    }
    return retStr
}

func sendDetailByRemovingChar(_ str:String, char:String = " ") -> String {
    let regExp :String = char + "\n\t\r"
    return String(str.filter { !(regExp.contains($0))})
}

func sendDetailByRemovingChar(_ attrStr:NSAttributedString, char:String = " ") -> String {
    let str:String = attrStr.string
    let regExp :String = char + "\n\t\r"
    return String(str.filter { !(regExp.contains($0))})
}


//MARK:- Delay Features
func delay(_ delay:Double, closure:@escaping ()->()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}


//MARK: - Local save
func getDirectoryPath() -> String {
    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    let documentsDirectory = paths[0]
    return documentsDirectory
}

func storeImageInDocumentDirectory(image : UIImage, imageName : String)
{
    let imgName = imageName + ".png"
    let fileManager = FileManager.default
    let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imgName)
    //print(paths)
    let imageData = image.pngData()
    fileManager.createFile(atPath: paths as String, contents: imageData, attributes: nil)
}

func getImage(imageName : String) -> UIImage?
{
    let imgName = imageName + ".png"
    let fileManager = FileManager.default
    let imagePAth = (getDirectoryPath() as NSString).appendingPathComponent(imgName)
    if fileManager.fileExists(atPath: imagePAth){
        return UIImage(contentsOfFile: imagePAth)!
    }else{
        return nil
    }
}

func deleteImage(fromDirectory imageName: String) -> Bool {
    if imageName.count == 0 {
        return true
    }
    let imgName = imageName + (".png")
    let fileManager = FileManager.default
    
    let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imgName)
    
    if fileManager.fileExists(atPath: paths){
        try! fileManager.removeItem(atPath: paths)
        return true
    }else{
        print("Something wronge.")
        return false
    }
}

func deleteFileFromDirectory(filePath : String)
{
    let fileManager = FileManager.default
    
    if fileManager.fileExists(atPath: filePath){
        try! fileManager.removeItem(atPath: filePath)
    }else{
        print("Something wronge.")
    }
}

func storeVideoInDocumentDirectory(videoUrl : URL, videoName : String)
{
    let video_name = videoName + ".mp4"
    let fileManager = FileManager.default
    let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(video_name)
    //print(paths)
    let videoData = try? Data(contentsOf: videoUrl)
    fileManager.createFile(atPath: paths as String, contents: videoData, attributes: nil)
}

func getVideo(videoName : String) -> String?
{
    let video_name = videoName + ".mp4"
    let fileManager = FileManager.default
    let videoPAth = (getDirectoryPath() as NSString).appendingPathComponent(video_name)
    if fileManager.fileExists(atPath: videoPAth){
        return videoPAth
    }else{
        return nil
    }
}

func deleteVideo(fromDirectory videoName: String) -> Bool {
    if videoName.count == 0 {
        return true
    }
    let video_Name = videoName + (".mp4")
    let fileManager = FileManager.default
    
    let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(video_Name)
    
    if fileManager.fileExists(atPath: paths){
        try! fileManager.removeItem(atPath: paths)
        return true
    }else{
        print("Something wronge.")
        return false
    }
}

func storeAudioInDocumentDirectory(videoData : Data, audioName : String)
{
    let audio_name = audioName
    let fileManager = FileManager.default
    let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(audio_name)
    print(paths)
    fileManager.createFile(atPath: paths as String, contents: videoData, attributes: nil)
}

func getAudio(audioName : String) -> String?
{
    let audio_name = audioName
    let fileManager = FileManager.default
    let path = (getDirectoryPath() as NSString).appendingPathComponent(audio_name)
    if fileManager.fileExists(atPath: path){
        return path
    }else{
        return nil
    }
}

func deleteAudio(fromDirectory audioName: String) -> Bool {
    if audioName.count == 0 {
        return true
    }
    let fileManager = FileManager.default
    let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(audioName)
    if fileManager.fileExists(atPath: paths){
        try! fileManager.removeItem(atPath: paths)
        return true
    }else{
        print("Something wronge.")
        return false
    }
}

// Get Video ID from URL
func extractYoutubeIdFromLink(link: String) -> String? {
    let pattern = "((?<=(v|V)/)|(?<=be/)|(?<=(\\?|\\&)v=)|(?<=embed/))([\\w-]++)"
    guard let regExp = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) else {
        return nil
    }
    let nsLink = link as NSString
    let options = NSRegularExpression.MatchingOptions(rawValue: 0)
    let range = NSRange(location: 0, length: nsLink.length)
    let matches = regExp.matches(in: link as String, options:options, range:range)
    if let firstMatch = matches.first {
        return nsLink.substring(with: firstMatch.range)
    }
    return nil
}


//CRATE THUMBNAIL
func getThumbnailFrom(path: String, btn : UIButton) {
    do {
        let asset = AVURLAsset(url: URL(string: path)! , options: nil)
        let imgGenerator = AVAssetImageGenerator(asset: asset)
        imgGenerator.appliesPreferredTrackTransform = true
        let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(value: 0, timescale: 1), actualTime: nil)
        let thumbnail = UIImage(cgImage: cgImage)
        btn.setBackgroundImage(thumbnail, for: .normal)
//        return thumbnail
    } catch let error {
        
        print("*** Error generating thumbnail: \(error.localizedDescription)")
    }
}


func displayPriceWithCurrency(_ price : String) -> String
{
    return "AED " + price
}

func setFlotingRating(_ rate : Double) -> String
{
    var strPrice : String = String(format: "%0.1f", rate)
    if strPrice.contains(".0")
    {
        strPrice = strPrice.replacingOccurrences(of: ".0", with: "")
    }
    return strPrice
}

func getMonthArray() -> [String]
{
    var monthArr : [String] = [String]()
    for i in 1...12
    {
        monthArr.append(String(i))
    }
    return monthArr
}

func getCardYearArray() -> [String]
{
    var yearArr : [String] = [String]()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "YYYY"
    let currentYear = dateFormatter.string(from: Date())
    
    for i in 0...30
    {
        yearArr.append(String(Int(currentYear)! + i))
    }
    return yearArr
}

func playVideo(_ url : String)
{
    let playerViewController = AVPlayerViewController()
    let videoUrl = URL(string: url)!
    let player = AVPlayer(url: videoUrl)
    playerViewController.player = player
    UIApplication.topViewController()!.present(playerViewController, animated: true) {
        playerViewController.player!.play()
    }
}

func attributedStringWithColor(_ mainString : String, _ strings: [String], color: UIColor, font: UIFont? = nil) -> NSAttributedString {
    let attributedString = NSMutableAttributedString(string: mainString)
    for string in strings {
        let range = (mainString as NSString).range(of: string)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        if font != nil {
            attributedString.addAttribute(NSAttributedString.Key.font, value: font!, range: range)
        }
    }
    return attributedString
}

//MARK:- Set Image

func setImageViewImage(_ imgView : UIImageView, _ strUrl : String, _ placeHolderImg : String)
{
    imgView.sd_setImage(with: URL(string: strUrl), placeholderImage: UIImage.init(named: placeHolderImg )) { (image, error, SDImageCacheType, url) in
        if image != nil {
            imgView.image = image?.imageCropped(toFit: CGSize(width: imgView.frame.size.width, height: imgView.frame.size.height))
        }else{
            imgView.image = nil
        }
    }
}

func setButtonBackgroundImage(_ button : UIButton, _ strUrl : String)
{
    button.sd_setBackgroundImage(with: URL(string: strUrl), for: UIControl.State.normal, completed: { (image, error, SDImageCacheType, url) in
        if image != nil{
            button.setBackgroundImage(image?.imageCropped(toFit: CGSize(width: button.frame.size.width, height: button.frame.size.height)), for: .normal)
        }
        else
        {
            button.setBackgroundImage(nil, for: .normal)
        }
    })
}

func setButtonImage(_ button : UIButton, _ strUrl : String)
{
    button.sd_setImage(with: URL(string: strUrl), for: .normal) { (image, error, SDImageCacheType, url) in
        if image != nil {
            button.setImage(image, for: .normal)
        }
    }
//    button.sd_setBackgroundImage(with: URL(string: strUrl), for: UIControl.State.normal, completed: { (image, error, SDImageCacheType, url) in
//        if image != nil{
//            button.setBackgroundImage(image?.imageCropped(toFit: CGSize(width: button.frame.size.width, height: button.frame.size.height)), for: .normal)
//        }
//        else
//        {
//            button.setBackgroundImage(nil, for: .normal)
//        }
//    })
}

func modifyCreditCardString(creditCardString : String) -> String {
    let trimmedString = creditCardString.components(separatedBy: .whitespaces).joined()

    let arrOfCharacters = Array(trimmedString)
    var modifiedCreditCardString = ""

    if(arrOfCharacters.count > 0) {
        for i in 0...arrOfCharacters.count-1 {
            modifiedCreditCardString.append(arrOfCharacters[i])
            if((i+1) % 4 == 0 && i+1 != arrOfCharacters.count){
                modifiedCreditCardString.append(" ")
            }
        }
    }
    return modifiedCreditCardString
}

func getCardImage(strType : String) -> String
{
    switch strType {
        case "visa":
            return "visa"
        case "mastercard":
            return "mastercard"
        case "mestro":
            return "mestro"
        default:
            break
    }
    return ""
}

func setTextFieldPlaceholderColor(_ textField : UITextField, _ color : UIColor)
{
    if textField.placeholder != "" {
        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: color])
    }
}
