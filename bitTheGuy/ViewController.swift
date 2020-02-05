//
//  ViewController.swift
//  bitTheGuy
//
//  Created by cheng jiayi on 2020/2/1.
//  Copyright © 2020 cheng jiayi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imageToPunch: UIImageView!
    
    var audioPlayer = AVAudioPlayer()
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func animateImage() {
        
        let bounds = self.imageToPunch.bounds
        
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: [], animations: {
            self.imageToPunch.bounds = CGRect(x: bounds.origin.x + 60, y: bounds.origin.y + 60, width: bounds.size.width - 60, height: bounds.size.height - 60)
        })
    
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer){
        if let sound = NSDataAsset(name: soundName){
            do{
                try audioPlayer = AVAudioPlayer (data: sound.data)
                audioPlayer.play()
            }catch{
                print("Error: data in \(soundName) cannot be played")
            }
        }else{
            print ("file \(soundName) cannot load")
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imageToPunch.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
               dismiss(animated: true, completion: nil)
    }
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController (title: "Camera not Available", message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
  
    @IBAction func libraryPressed(_ sender: UIButton) {
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
        
    }
   
    @IBAction func cameraPressed(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = .camera
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
        }else{
            showAlert(title: "Camera Not Available", message: "There is no camera avaialbel")
        }
        
            
        
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        animateImage()
        playSound(soundName: "punchSound", audioPlayer: &audioPlayer)
    }
    
}

