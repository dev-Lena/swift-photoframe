//
//  SecondViewController.swift
//  PhotoFrame
//
//  Created by Keunna Lee on 2020/02/03.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    // MARK: - view
    @IBOutlet weak var photoFrame: UIImageView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoAlbumText: UILabel!
    let imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerController.delegate = self
        self.photoFrame.image = UIImage(named: "photoframe-border")
        self.photoImageView.contentMode = .scaleAspectFill
        self.photoAlbumText.text = "Photo Album"
        self.photoImageView.image = generateRandomUIImage()
    }
    
    // MARK: - model
    func generateRandomNumber()->Int{
        return Int(arc4random_uniform(21) + 01)
    }
    
    func generateRandomUIImage() -> UIImage {
        let images = (01 ... 22).compactMap{
            $0 < 10 ? UIImage(named: "0\($0).jpg") : UIImage(named: "\($0).jpg")
        }
        return images[generateRandomNumber()]
    }
    
    @IBAction func selectButtonTouched(_ sender: Any) {
        self.imagePickerController.sourceType = .photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func nextImageButtonTouched(_ sender: UIButton) {
        self.photoImageView.image = generateRandomUIImage()
    }
}
extension SecondViewController : UIImagePickerControllerDelegate,

UINavigationControllerDelegate{
}
