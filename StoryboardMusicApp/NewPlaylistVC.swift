//
//  NewPlaylistVC.swift
//  StoryboardMusicApp
//
//  Created by Abby Dominguez on 19/10/22.
//

import UIKit

class NewPlaylistVC: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var textField: UITextField!
    let collectionVC = CollectionViewController()
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var imageAlbumOutlet: UIImageView!
    
    @IBAction func doneButtonAction(_ sender: Any) {
        if !(textField.text?.isEmpty ?? false) {
            textField.resignFirstResponder()
            let imgObj = imageAlbumOutlet.image //TODO: Convert to b64 and store the image
            let newAlbum = Album(context: context)
            newAlbum.albumName = textField.text
            newAlbum.albumArtist = "You"
            newAlbum.albumPictureURL = "https://images.pushsquare.com/df6ea78291fa0/cyberpunk-edgerunners-anime-review.large.jpg"
            try! context.save()
            let uialert = UIAlertController(title: "Playlist added", message: "The playlist has been added and saved to your iPhone", preferredStyle: UIAlertController.Style.alert)
            uialert.addAction(UIAlertAction(title: "Cool", style: UIAlertAction.Style.default, handler:   { (action) in
                self.textField.text = ""
            }))
               self.present(uialert, animated: true, completion: nil)
        }
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
        
        //TODO: Add options for adding songs from the database into the playlists
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
extension NewPlaylistVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let key = UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.originalImage.rawValue)
        
        if let image = info[key] as? UIImage{
            self.imageAlbumOutlet.image = image
            picker.dismiss(animated: true)
        }
    }
}
