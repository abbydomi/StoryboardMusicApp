//
//  NewPlaylistVC.swift
//  StoryboardMusicApp
//
//  Created by Abby Dominguez on 19/10/22.
//

import UIKit

class NewPlaylistVC: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    let collectionVC = CollectionViewController()
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var imageAlbumOutlet: UIImageView!
    
    @IBAction func doneButtonAction(_ sender: Any) {
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageAlbumOutlet.layer.cornerRadius = 22.0
        
        let menuClosure = {(action: UIAction) in
            self.pickImage(from: action.title)
            }
            photoButton.menu = UIMenu(children: [
                    UIAction(title: "Take Photo", image: (UIImage(systemName: "camera")), handler:
                                        menuClosure),
                    UIAction(title: "Choose Photo", image: (UIImage(systemName: "photo.on.rectangle")), handler: menuClosure),
                ])
    }
    func pickImage(from: String){
        if from == "Take Photo"{
            let vc = UIImagePickerController()
            vc.delegate = self
            vc.sourceType = .camera
            vc.allowsEditing = false
            present(vc, animated: true)
        }
        else {
            let vc = UIImagePickerController()
            vc.delegate = self
            vc.sourceType = .photoLibrary
            vc.allowsEditing = false
            present(vc, animated: true)
        }
    }
}
