//
//  SecondViewController.swift
//  PhotoFrame
//
//  Created by moon on 2018. 5. 24..
//  Copyright © 2018년 moon. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    
    private let imagePicker: UIImagePickerController
    private let numberOfImages: UInt32 = 22
    private var currentImageNumber: Int = 0
    
    required init?(coder aDecoder: NSCoder) {
        self.imagePicker = UIImagePickerController()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(#file, #line, #function, #column)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: IBAction methods
    @IBAction func selectButtonTouched(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            self.imagePicker.delegate = self
            self.imagePicker.sourceType = .savedPhotosAlbum
            self.imagePicker.allowsEditing = true
            self.present(self.imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func nextImageButtonTouched(_ sender: Any) {
        let imageName: String = String(format: "Demo Images/%02d.jpg", self.generateRandomNumber())
        guard let photoImage = UIImage(named: imageName) else {
            return
        }
        self.photoImageView.contentMode = .scaleAspectFit
        self.photoImageView.clipsToBounds = true
        self.photoImageView.image = photoImage
    }
    
    private func generateRandomNumber() -> Int {
        // 이미 현재 이미지의 고르지 않도록 중복방지
        var randomNumber = Int(arc4random_uniform(self.numberOfImages)) + 1
        while randomNumber == self.currentImageNumber {
            randomNumber = Int(arc4random_uniform(self.numberOfImages)) + 1
        }
        self.currentImageNumber = randomNumber
        return randomNumber
    }
    
}

extension SecondViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
}
