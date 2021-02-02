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
    
    
}

