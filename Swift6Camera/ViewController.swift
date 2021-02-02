//
//  ViewController.swift
//  Swift6Camera
//
//  Created by 長井崚介 on 2021/02/02.
//

import UIKit
import Photos

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var checkPermission = CheckPermission()
    
    
    @IBOutlet weak var backImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkPermission.checkCamera()
        
        
    }

   
    @IBAction func camera(_ sender: Any) {
        
        let sourceType:UIImagePickerController.SourceType = .camera
        createImagePicker(sourceType: sourceType)
        
    }
    
    @IBAction func album(_ sender: Any) {
        
        let sourceType:UIImagePickerController.SourceType = .photoLibrary
        createImagePicker(sourceType: sourceType)
        
    }
    
    @IBAction func share(_ sender: Any) {
        
        let text = ""
        let image = backImageView.image?.jpegData(compressionQuality: 0.5)
        let item = [text,image as Any]
        let activityVC = UIActivityViewController(activityItems: item, applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
        
    }
    
    //アルバムを立ち上げるメソッド
    func createImagePicker(sourceType:UIImagePickerController.SourceType){
        
        //インスタンスの作成
        let cameraPicker = UIImagePickerController()
        cameraPicker.sourceType = sourceType
        cameraPicker.delegate = self
        cameraPicker.allowsEditing = true
        self.present(cameraPicker, animated: true, completion: nil)
    }
    
    //撮影（アルバム）のキャンセルボタンがタップされた時
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let picerImage = info[.editedImage] as? UIImage{
            
            //画像を反映する処理
            backImageView.image = picerImage
            
            //閉じる処理
            picker.dismiss(animated: true, completion: nil)
            
        }
        
        
    }
    
}

